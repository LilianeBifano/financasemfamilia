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
    visit root_path

    click_on 'Cadastre-se'

    fill_in 'Email', with: 'eduardo@gmail.com'
    fill_in 'Senha', with: '1234567'
    fill_in 'Confirmar', with: '1234567'
    click_on 'Cadastrar-me'

    fill_in 'Nome da Familia', with: 'Silva'
    fill_in 'Quantidade de Pessoas', with: '5'
    click_on 'Salvar'

    click_on 'Inserir Gastos'
    fill_in 'Data', with: '01/08/2018'
    fill_in 'Descrição', with: 'Compra de calça jeans'
    fill_in 'Valor', with: 'R$109,70'
    select 'Vestuário e acessórios', from: 'Tipo'
    click_on 'Registrar'

    expect(page).to have_content('eduardo@gmail.com')
    expect(page).to have_content('Compra de calça jeans')
  end
end
