require 'rails_helper'

RSpec.feature 'Cadastrando Clientes', type: :feature do
  let(:user) { create(:user) }
  let!(:tipo_de_pessoa) { create(:tipo_de_pessoa) }
  let!(:pais) { create(:pais) }
  let!(:uf) { create(:uf) }
  let!(:municipio) { create(:municipio, uf: uf) }

  before do
    sign_in user
  end

  scenario 'Criando um cliente válido' do
    visit '/clientes'
    click_on 'Cadastrar'
    select(tipo_de_pessoa.nome_por_extenso, from: 'cliente_tipo_de_pessoa_id')
    select(pais.nome, from: 'cliente_pais_id')
    select(uf.nome_por_extenso, from: 'cliente_uf_id')
    select(municipio.nome, from: 'cliente_municipio_id')
    fill_form(:cliente, attributes_for(:cliente))
    click_on 'Salvar'
    expect(page).to have_content(/Cliente cadastrado com sucesso/)
  end
end
