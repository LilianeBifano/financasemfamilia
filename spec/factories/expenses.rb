FactoryBot.define do
  factory :expense do
    date '01/07/2018'
    description 'Jantar em família no MC'
    expense_type 'Alimentação'
    value '60,00'
  end
end
