require 'rails_helper'

feature 'Register of expenses' do
  scenario 'successfully' do
    user = create(:user, email: 'teste@gmail.com', password: '123456')
    
    visit root_path
    within('.navbar') do
      click_on 'Entrar'
    end

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: '123456'
    within('.form-actions') do
      click_on 'Entrar'
    end

    within('.navbar') do
      click_on 'Inserir Gastos'
    end

    fill_in 'Data', with: '01/08/2018'
    fill_in 'Descrição', with: 'Compra de calça jeans'
    fill_in 'Valor', with: 'R$109,70'
    select 'Vestuário e acessórios', from: 'Tipo'

    click_on 'Registrar'

    expect(page).to have_content('Saída de recursos cadastrada')

  end

  scenario 'insuccessfully' do
    user = create(:user, email: 'teste@gmail.com', password: '123456')

    visit root_path
    within('.navbar') do
      click_on 'Entrar'
    end

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: '123456'
    within('.form-actions') do
      click_on 'Entrar'
    end

    within('.navbar') do
      click_on 'Inserir Gastos'
    end

    fill_in 'Data', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Valor', with: ''
    select '', from: 'Tipo'

    click_on 'Registrar'

    expect(page).to have_css('p', text: 'Data não pode ficar em branco')
    expect(page).to have_css('p', text: 'Descrição não pode ficar em branco')
    expect(page).to have_css('p', text: 'Valor não pode ficar em branco')
    expect(page).to have_css('p', text: 'Tipo não pode ficar em branco')
  end
  scenario 'try access without signed in' do
    visit new_expense_path

    expect(current_path).to eq(user_session_path)
  end
end
