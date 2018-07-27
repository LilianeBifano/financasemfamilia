require 'rails_helper'

feature 'User see revenues' do
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
    visit new_revenue_path

    fill_in 'Data', with: '01/08/2018'
    fill_in 'Descrição', with: 'Salário Mensal'
    fill_in 'Valor', with: 'R$2000,70'
    select 'Salário', from: 'Tipo'
    click_on 'Registrar'

    expect(page).to have_content('Entrada de recursos cadastrada com sucesso!')
  end

  scenario 'user login and views own revenues' do
    family = create(:family)
    user = create(:user, family: family)

    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    within('.form-actions') do
      click_on 'Entrar'
    end

    click_on 'Inserir Ganhos'
    fill_in 'Data', with: '01/08/2018'
    fill_in 'Descrição', with: 'Salário Mensal'
    fill_in 'Valor', with: 'R$2000,70'
    select 'Salário', from: 'Tipo'
    click_on 'Registrar'

    expect(page).to have_content('pedro@financeiro.com')
    expect(user.revenues.count).to eq(1)
  end
end
