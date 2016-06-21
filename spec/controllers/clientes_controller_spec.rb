require 'rails_helper'

RSpec.describe ClientesController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET new' do
    it 'assings @cliente' do
      get :new
      expect(assigns(:cliente)).to be_a(Cliente)
    end

    it 'renderes the new template' do
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
end
