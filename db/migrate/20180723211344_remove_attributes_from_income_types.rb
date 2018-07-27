class RemoveAttributesFromIncomeTypes < ActiveRecord::Migration[5.2]
  def change
    remove_column :income_types, :income_date, :date
    remove_column :income_types, :description, :string
    remove_column :income_types, :value, :decimal
  end
end
