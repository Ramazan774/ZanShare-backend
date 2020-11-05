class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.integer :product_id
      t.string :title
      t.integer :rating
      t.text :description
      t.integer :price
      t.string :image_url

      t.timestamps
    end
  end
end
