require 'rails_helper'

RSpec.feature 'CreatingEmissores', type: :feature do
  let(:user) { create(:user) }
  let!(:tipo_de_pessoa) { create(:tipo_de_pessoa) }
  let!(:uf) { create(:uf) }
  let!(:municipio) { create(:municipio, uf: uf) }

  before do
    sign_in user
  end

  scenario 'Creating a valid emissor' do
    visit '/emissores/new'
    select(tipo_de_pessoa.nome_por_extenso, from: 'emissor_tipo_de_pessoa_id')
    select(municipio.nome, from: 'emissor_municipio_id')
    select(uf.nome_por_extenso, from: 'emissor_uf_id')
    fill_form(:emissor, attributes_for(:emissor))
    click_on 'Salvar'
    expect(page).to have_content(/Emissor cadastrado com sucesso/)
  end
end
