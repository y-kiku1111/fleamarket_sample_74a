class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id
      t.string :city,             null: false
      t.integer :postal_code,     null: false
      t.string :other,            null: false
      t.string :building_name
      t.integer :user_id
      t.timestamps
    end
  end
end
