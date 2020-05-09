class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :price, null: false
      t.integer :status, null: false
      t.integer :bear, null: false
      t.integer :days, null: false
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end