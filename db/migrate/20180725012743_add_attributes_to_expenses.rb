class AddAttributesToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :date, :datetime
  end
end
