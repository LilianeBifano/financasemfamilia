require 'rails_helper'

feature 'Edit user informations' do
  scenario 'succefully' do
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
    click_on 'Editar Usuário'
    fill_in 'Nome', with: 'Jose'
    fill_in 'Senha Atual', with: user.password
    click_on 'Atualizar Usuário'
    user.reload

    expect(page).to have_content('Sua conta foi atualizada com sucesso.')
    expect(user.name).to eq('Jose')
  end
end
