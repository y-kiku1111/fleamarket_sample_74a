class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|

      t.integer :like
      t.integer :user_id, foreign_key: true, null: false
      t.integer :product_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
