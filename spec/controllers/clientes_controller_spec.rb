require 'rails_helper'

RSpec.describe ClientesController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET new' do
    it 'assigns @cliente' do
      get :new
      expect(assigns(:cliente)).to be_a(Cliente)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    context 'when cliente is valid' do
      let(:cliente_params) { build(:cliente).attributes }

      it 'creates cliente' do
        post :create, params: { cliente: cliente_params }
        expect(user.clientes.count).to eq(1)
      end

      it 'redirect to edit path' do
        post :create, params: { cliente: cliente_params }
        expect(response).to redirect_to(edit_cliente_path(Cliente.first))
      end
    end

    context 'when cliente is invalid' do
      let(:cliente_params) { Cliente.new.attributes }

      it 'not creates cliente' do
        post :create, params: { cliente: cliente_params }
        expect(user.clientes.count).to eq(0)
      end

      it 'renders the new template' do
        post :create, params: { cliente: cliente_params }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET edit' do
    context 'when cliente belongs to user' do
      let!(:cliente) { create(:cliente, user: user) }

      it 'assigns @cliente from user' do
        get :edit, params: { id: cliente.id }
        expect(assigns(:cliente)).to eq(cliente)
      end

      it 'renders the edit template' do
        get :edit, params: { id: cliente.id }
        expect(response).to render_template(:edit)
      end
    end

    context 'when cliente not belongs to user' do
      let!(:another_user) { create(:user) }
      let!(:another_cliente) { create(:cliente, user: another_user) }

      it 'raise RecordNotFound' do
        expect do
          get :edit, params: { id: another_cliente.id }
        end.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'PUT update' do
    context 'when cliente is valid' do
      let(:cliente) { create(:cliente, user: user) }

      it 'updates cliente' do
        expect do
          put :update, params: {
            id: cliente.id,
            cliente: { razao_social: 'fooo inc' }
          }
        end.to change { cliente.reload.razao_social }.from('foo').to('fooo inc')
      end

      it 'redirect to edit path' do
        put :update, params: {
          id: cliente.id,
          cliente: { razao_social: 'fooo inc' }
        }
        expect(response).to redirect_to(edit_cliente_path(cliente))
      end
    end

    context 'when cliente is invalid' do
      let(:cliente) { create(:cliente, user: user) }

      it 'not updates cliente' do
        expect do
          put :update, params: {
            id: cliente.id,
            cliente: { razao_social: nil }
          }
        end.to_not change { cliente.reload.razao_social }.from('foo')
      end

      it 'renders edit template' do
        put :update, params: { id: cliente.id, cliente: { razao_social: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end
end
