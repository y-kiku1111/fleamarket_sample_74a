class AddExhibitorUserIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :exhibitor_user_id, :integer, foreign_key:true, null:false

    add_column :products, :buyer_user_id, :integer, foreign_key:true
  end
end
