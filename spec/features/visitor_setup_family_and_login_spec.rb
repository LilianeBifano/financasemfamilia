require 'rails_helper'

feature 'Visitor setup family and login' do
  scenario 'Successfully' do
    create(:family)
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

    click_on 'Minhas Configurações'
    click_on 'Cadastrar Familia'

    fill_in 'Nome da Familia', with: 'Silva'
    fill_in 'Quantidade de Pessoas', with: '5'
    click_on 'Salvar'

    expect(page).to have_content('pedro@financeiro.com')
    expect(page).to have_content('Familia Cadastrada com Sucesso')
    expect(page).to have_content('Familia: Silva')
    expect(page).not_to have_content('Cadastrar Familia')
    expect(page).not_to have_content('Cadastro')
  end
end
