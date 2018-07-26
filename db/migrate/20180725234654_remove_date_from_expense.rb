class RemoveDateFromExpense < ActiveRecord::Migration[5.2]
  def change
    remove_column :expenses, :date, :datetime
  end
end
