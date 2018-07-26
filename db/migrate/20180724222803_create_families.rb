class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.string :name
      t.integer :guest_total
      t.string :cep
      t.string :target
      t.decimal :target_value

      t.timestamps
    end
  end
end
