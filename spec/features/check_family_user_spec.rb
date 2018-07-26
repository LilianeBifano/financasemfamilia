require 'rails_helper'

  feature 'visit_home_index' do
    scenario 'check_family_user' do
      user = create(:user, family: nil)

      visit root_path
      within('.navbar') do
        click_on 'Entrar'
      end
      fill_in 'Email', with: user.email
      fill_in 'Senha', with: user.password
      within('.form-actions') do
        click_on 'Entrar'
      end

      visit new_expense_path

      expect(current_path).to eq(new_family_path)
      expect(page).to have_content('Cadastro de Família')
      expect(user.family).to be_nil
      
    end

    scenario 'and check_family_user successfully' do
      
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

      visit new_expense_path

      expect(page).to have_content('Gastos')
    end
  end
