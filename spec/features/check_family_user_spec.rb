require 'rails_helper'

  feature 'visit_home_index' do
    scenario 'check_family_user' do
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

      visit new_expense_path

      expect(controller.current_user).to eq(user)
      expect(page).to have_content('Cadastro de Família')
      expect(user.family).to be_nil
      expect(current_path).to eq(new_family_path)
    end

    scenario 'and check_family_user successfully' do
      user = create(:user)
      family = create (:family)

      visit root_path
      within('.navbar') do
        click_on 'Entrar'
      end
      fill_in 'Email', with: user.email
      fill_in 'Senha', with: user.password
      within('.form-actions') do
        click_on 'Entrar'
      end

      visit family_path

      click_on 'Cadastrar Familia'

      fill_in 'Nome da Familia', with: 'Silva'
      fill_in 'Quantidade de Pessoas', with: '5'
      click_on 'Salvar'

      expect(page).to have_content('Silva')

      visit new_expense_path

      expect(page).to have_content('Gastos')
    end
  end
