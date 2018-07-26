class RemoveIncomeType < ActiveRecord::Migration[5.2]
  def change
    drop_table :income_types
  end
end
