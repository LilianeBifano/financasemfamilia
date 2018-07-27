class RemoveAttributesFromExpenses < ActiveRecord::Migration[5.2]
  def change
    remove_column :expenses, :date, :string
  end
end
