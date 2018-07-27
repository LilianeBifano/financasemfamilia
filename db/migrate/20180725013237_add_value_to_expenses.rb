class AddValueToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :value, :decimal
  end
end
