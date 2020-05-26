class AddAreaToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :area, :integer
  end
end
