require 'rails_helper'

RSpec.describe EmissoresController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET new' do
    it 'assigns @emissor' do
      get :new
      expect(assigns(:emissor)).to be_a_new(Emissor)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    context 'when emissor is valid' do
      it 'creates emissor' do
        emissor_params = build(:emissor).attributes
        post :create, params: { emissor: emissor_params }
        expect(user.reload.emissor).to be_a(Emissor)
      end
    end

    context 'when emissor is invalid' do
      let(:emissor_params) { Emissor.new.attributes }

      it 'not creates emissor' do
        post :create, params: { emissor: emissor_params }
        expect(Emissor.count).to eq(0)
      end

      it 'renders the new template' do
        post :create, params: { emissor: emissor_params }
        expect(response).to render_template(:new)
      end
    end
  end
end
