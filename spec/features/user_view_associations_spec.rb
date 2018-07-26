require 'rails_helper'

feature 'User see expanses and revenues' do
  scenario 'Successfully' do
    family = create(:family)
    user = create(:user, family: family)
    expense = create(:expense, user: user)

    visit root_path

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    within('.form-actions') do
      click_on 'Entrar'
    end

    visit new_expense_path

    expect(page).to have_content("Despesa Inserida pelo Usuário #{user.name}")
  end
end