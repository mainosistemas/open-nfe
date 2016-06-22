require 'rails_helper'

RSpec.feature 'Updating Clientes', type: :feature do
  let(:user) { create(:user) }
  let(:cliente) { create(:cliente, user: user) }

  before do
    sign_in user
  end

  scenario 'updating a valid cliente' do
    visit "/clientes/#{cliente.id}/edit"
    fill_in 'cliente_razao_social', with: 'Nova razão social LTDA'
    click_on 'Salvar'
    expect(page).to have_content(/Cliente atualizado com sucesso/)
  end
end
