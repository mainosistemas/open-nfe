require 'rails_helper'

RSpec.feature 'Listando Clientes', type: :feature do

  let(:user) { create(:user) }

  before do
    sign_in user
  end

  scenario 'Acessando uma lista com clientes cadastrados' do
    cliente = create(:cliente, user: user)
    visit '/clientes'
    expect(page).to have_content(cliente.tipo_de_pessoa.codigo)
    expect(page).to have_content(cliente.numero_do_documento)
    expect(page).to have_content(cliente.razao_social)
    expect(page).to have_content(cliente.uf.nome)
  end
end
