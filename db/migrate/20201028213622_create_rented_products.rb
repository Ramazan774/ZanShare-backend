class CreateRentedProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :rented_products do |t|
      t.string :title
      t.integer :rating
      t.text :description
      t.integer :price
      t.string :image_url
      t.integer :user_id

      t.timestamps
    end
  end
end
