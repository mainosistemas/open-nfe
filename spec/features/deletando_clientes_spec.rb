require 'rails_helper'

RSpec.feature 'Deletando Clientes', type: :feature do
  let(:user) { create(:user) }
  let!(:cliente) { create(:cliente, user: user) }

  before do
    sign_in user
  end

  scenario 'Deletando um cliente', js: true do
    visit '/clientes'
    click_on 'Deletar'
    page.driver.browser.accept_confirm
    expect(page).to_not have_content(cliente.razao_social)
  end
end
