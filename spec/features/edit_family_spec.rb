require 'rails_helper'

feature 'Edit family informations' do
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
    click_on 'Editar Família'
    fill_in 'Nome da Familia', with: 'Pereira'
    click_on 'Atualizar Família'

    expect(page).to have_content('Sua Familia foi atualizada com sucesso.')
  end
end