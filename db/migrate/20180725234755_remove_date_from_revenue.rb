class RemoveDateFromRevenue < ActiveRecord::Migration[5.2]
  def change
    remove_column :revenues, :date, :datetime
  end
end
