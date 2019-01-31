class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :url
      t.string :product_id
      t.string :integer

      t.timestamps
    end
  end
end
