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
    it 'creates emissor' do
      emissor_params = attributes_for(:emissor)
      post :create, emissor: emissor_params
      expect(user.reload.emissor).to be_a(Emissor)
    end
  end
end
