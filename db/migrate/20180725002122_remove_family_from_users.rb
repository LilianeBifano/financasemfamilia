class RemoveFamilyFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :family, :string
  end
end
