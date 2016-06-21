require 'rails_helper'

RSpec.feature 'UpdatingEmissores', type: :feature do
  let(:user) { create(:user) }
  let(:emissor) { create(:emissor, user: user) }

  before do
    sign_in user
  end

  scenario 'Updating a valid emissor' do
    visit "/emissores/#{emissor.id}/edit"
    fill_in 'emissor_razao_social', with: 'Foo LTDA'
    click_on 'Salvar'
    expect(page).to have_content(/Emissor atualizado com sucesso/)
    expect(current_path).to eq "/emissores/#{emissor.id}/edit"
    expect(emissor.reload.razao_social).to eq 'Foo LTDA'
  end
end
