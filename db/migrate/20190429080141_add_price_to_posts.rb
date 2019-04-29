class AddPriceToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :price, :decimal, precision:8, scale:2
  end
end
