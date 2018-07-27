require 'rails_helper'

feature 'visit_home_index' do
  scenario 'sucessfully' do
    visit root_path

    expect(page).to have_content('Cadastre-se')
    expect(page).to have_content('Entrar')
    expect(page).not_to have_content('Minhas Configurações')
    expect(page).not_to have_content('Inserir Gastos')
    expect(page).not_to have_content('Inserir Ganhos')
  end

  scenario 'not view login' do
    create(:family)
    user = create(:user)

    visit root_path
    within('.navbar') do
      click_on 'Entrar'
    end
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    within('.form-actions') do
      click_on 'Entrar'
    end

    expect(page).to have_content(user.email)
    expect(page).to have_content('Minhas Configurações')
    expect(page).to have_content('Inserir Gastos')
    expect(page).to have_content('Inserir Ganhos')
    expect(page).to have_content('Fluxo Mensal')
    expect(page).not_to have_content('Entrar')
  end
end
