class CreateRevenues < ActiveRecord::Migration[5.2]
  def change
    create_table :revenues do |t|
      t.datetime :date
      t.string :description
      t.decimal :value
      t.string :revenue_type

      t.timestamps
    end
  end
end
