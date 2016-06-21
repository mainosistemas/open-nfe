require 'rails_helper'

RSpec.feature 'CreatingEmissores', type: :feature do
  let(:tipo_pessoa) { create(:tipo_pessoa) }
  let(:uf) { create(:uf) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'Creating a valid emissor' do
    visit '/emissores/new'
    fill_form(:emissor, attributes_for(:emissor))
    click_on 'Salvar'
    expect(page).to have_content(/Emissor cadastrado com sucesso/)
  end
end
