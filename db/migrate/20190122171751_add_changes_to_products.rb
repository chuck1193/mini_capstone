class AddChangesToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :description, :text
    change_column :products, :price, "NUMERIC USING CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 6, scale: 2
  end
end
