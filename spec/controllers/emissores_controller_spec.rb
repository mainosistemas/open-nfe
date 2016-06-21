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

  describe 'GET edit' do
    context 'when emissor belongs to user' do
      let(:emissor) { create(:emissor, user: user) }

      it 'assigns @emissor' do
        get :edit, params: { id: emissor.id }
        expect(assigns(:emissor)).to eq(emissor)
      end

      it 'renders the edit template' do
        get :edit, params: { id: emissor.id }
        expect(response).to render_template('edit')
      end
    end

    context 'when emissor not belongs to user' do
      let(:user) { create(:user) }
      let!(:emissor) { create(:emissor, user: user) }

      let(:another_user) { create(:user) }
      let!(:another_emissor) { create(:emissor, user: another_user) }

      it "renders user's emissor" do
        get :edit, params: { id: another_emissor.id }
        expect(assigns(:emissor)).to eq(emissor)
      end
    end
  end

  describe 'PUT update' do
    context 'when emissor is valid' do
      let(:emissor) { create(:emissor, user: user) }

      it 'updates emissor' do
        expect {
          put :update, params: { id: emissor.id, emissor: { razao_social: 'nova razao'} }
        }.to change { emissor.reload.razao_social }.from('FOO LTDA').to('nova razao')
      end

      it 'redirect to edit_path' do
        put :update, params: { id: emissor.id, emissor: { razao_social: 'nova razao' } }
        expect(response).to redirect_to(edit_emissor_path(emissor))
      end
    end

    context 'when emissor is invalid' do
      let(:emissor) { create(:emissor, user: user) }

      it 'not updates emissor' do
        expect {
          put :update, params: { id: emissor.id, emissor: { razao_social: nil } }
        }.to_not change { emissor.reload.razao_social }.from('FOO LTDA')
      end

      it 'renders the edit template' do
        put :update, params: { id: emissor.id, emissor: { razao_social: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end
end
