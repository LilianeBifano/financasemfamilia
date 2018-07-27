require 'rails_helper'

feature 'User see expanses and revenues' do
  scenario 'Successfully' do
    family = create(:family)
    user = create(:user, family: family)

    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    within('.form-actions') do
      click_on 'Entrar'
    end
    visit new_expense_path

    fill_in 'Data', with: '01/08/2018'
    fill_in 'Descrição', with: 'Compra de calça jeans'
    fill_in 'Valor', with: 'R$109,70'
    select 'Vestuário e acessórios', from: 'Tipo'

    click_on 'Registrar'

    expect(page).to have_content('Saída de recursos cadastrada com sucesso!')
  end

  scenario 'user login and views own expenses' do
    family = create(:family)
    user = create(:user, family: family)

    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    within('.form-actions') do
      click_on 'Entrar'
    end

    click_on 'Inserir Gastos'
    fill_in 'Data', with: '01/08/2018'
    fill_in 'Descrição', with: 'Compra de calça jeans'
    fill_in 'Valor', with: 'R$109,70'
    select 'Vestuário e acessórios', from: 'Tipo'
    click_on 'Registrar'

    expect(page).to have_content('pedro@financeiro.com')
    expect(user.expenses.count).to eq(1)
  end
end
