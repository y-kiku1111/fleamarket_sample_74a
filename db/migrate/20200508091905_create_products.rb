class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :price, null: false
      t.integer :status, null: false
      t.integer :bear, null: false
      t.integer :days, null: false
      t.integer :user_id, foreign_key: true, null:false
      t.integer :category_id, foreign_key: true, null:false
      t.timestamps
    end
  end
end