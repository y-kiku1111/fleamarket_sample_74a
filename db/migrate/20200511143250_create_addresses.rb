class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :send_first_name,               null: false
      t.string :send_last_name,                null: false
      t.string :send_first_name_furigana,      null: false
      t.string :send_last_name_furigana,       null: false
      t.integer :prefecture_id,                 null: false
      t.string :city,                           null: false
      t.integer :postal_code,                   null: false
      t.string :other,                          null: false
      t.string :building_name
      t.integer :user_id
      t.timestamps
    end
  end
end
