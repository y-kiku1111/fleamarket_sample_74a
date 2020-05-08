class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.integer :postal_code, null: false
      t.string :city, null: false
      t.string :other, null: false
      t.string :building_name
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
