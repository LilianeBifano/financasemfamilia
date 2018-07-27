require 'rails_helper'

feature 'User add user in family' do
  scenario 'successfully' do
    family = create(:family)
    user = create(:user, family: family)

    visit root_path
    within('.navbar') do
      click_on 'Entrar'
    end
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    within('.form-actions') do
      click_on 'Entrar'
    end

    click_on 'Minhas Configurações'
    click_on 'Cadastrar Usuário'

    fill_in 'Email', with: 'antonio@financeiro.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmar', with: '12345678'
    click_on 'Cadastrar'

    expect(page).to have_content('Usuário Cadastrado com Sucesso')
    expect(page).to have_content("Familia: #{family.name}")
    expect(family.users.count).to eq(2)
  end
end
