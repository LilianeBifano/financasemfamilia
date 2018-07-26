class AddAttributesToIncomeTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :income_types, :income_date, :date
    add_column :income_types, :description, :string
    add_column :income_types, :value, :decimal
  end
end
