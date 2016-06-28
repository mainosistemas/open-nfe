require 'rails_helper'

RSpec.describe ClientesController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    let(:clientes) { create_list(:cliente, 3, user: user) }
    let(:outro_usuario) { create(:user) }
    let(:cliente_de_outro_usuario) { create(:cliente, user: outro_usuario) }

    it 'define @clientes somente com os clientes do usuário' do
      get :index
      expect(assigns(:clientes)).to eq clientes
    end
  end

  describe 'GET #new' do
    it 'define @cliente' do
      get :new
      expect(assigns(:cliente)).to be_a(Cliente)
    end

    it 'renderiza o template new' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'quando o cliente é válido' do
      let(:cliente_params) { build(:cliente).attributes }

      it 'cadastra o cliente' do
        post :create, params: { cliente: cliente_params }
        expect(user.clientes.count).to eq(1)
      end

      it 'redireciona para o edit path' do
        post :create, params: { cliente: cliente_params }
        expect(response).to redirect_to(edit_cliente_path(Cliente.first))
      end
    end

    context 'quando o cliente não é válido' do
      let(:cliente_params) { Cliente.new.attributes }

      it 'não cadastra o cliente' do
        post :create, params: { cliente: cliente_params }
        expect(user.clientes.count).to eq(0)
      end

      it 'renderiza o new template' do
        post :create, params: { cliente: cliente_params }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    context 'quando o cliente pertence ao usuário' do
      let!(:cliente) { create(:cliente, user: user) }

      it 'define @cliente' do
        get :edit, params: { id: cliente.id }
        expect(assigns(:cliente)).to eq(cliente)
      end

      it 'renderiza o edit path' do
        get :edit, params: { id: cliente.id }
        expect(response).to render_template(:edit)
      end
    end

    context 'quando o cliente não pertence ao usuário' do
      let!(:another_user) { create(:user) }
      let!(:another_cliente) { create(:cliente, user: another_user) }

      it 'raise RecordNotFound' do
        expect do
          get :edit, params: { id: another_cliente.id }
        end.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'PUT #update' do
    context 'quando o cliente não é válido' do
      let(:cliente) { create(:cliente, user: user) }

      it 'atualiza o cliente' do
        expect do
          put :update, params: {
            id: cliente.id,
            cliente: { razao_social: 'fooo inc' }
          }
        end.to change { cliente.reload.razao_social }.from('foo').to('fooo inc')
      end

      it 'redireciona para o edit path' do
        put :update, params: {
          id: cliente.id,
          cliente: { razao_social: 'fooo inc' }
        }
        expect(response).to redirect_to(edit_cliente_path(cliente))
      end
    end

    context 'quando o cliente não é válido' do
      let(:cliente) { create(:cliente, user: user) }

      it 'not updates cliente' do
        expect do
          put :update, params: {
            id: cliente.id,
            cliente: { razao_social: nil }
          }
        end.to_not change { cliente.reload.razao_social }.from('foo')
      end

      it 'renderiza o edit template' do
        put :update, params: { id: cliente.id, cliente: { razao_social: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:cliente) { create(:cliente, user: user) }

    it 'deleta o cliente' do
      expect do
        delete :destroy, params: { id: cliente.id }
      end.to change { user.reload.clientes.count }.from(1).to(0)
    end

    it 'redireciona para o index path' do
      delete :destroy, params: { id: cliente.id }
      expect(response).to redirect_to(clientes_path)
    end
  end
end
