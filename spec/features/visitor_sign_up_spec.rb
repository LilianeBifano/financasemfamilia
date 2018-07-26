require 'rails_helper'

feature 'visitor_sign_up' do
  scenario 'successfully' do
    visit root_path

    click_on 'Cadastre-se'

    fill_in 'Email', with: 'teste@gmail.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirmar', with: '123456'
    click_on 'Cadastrar-me'

    expect(page).to have_content('teste@gmail.com')
  end
end
