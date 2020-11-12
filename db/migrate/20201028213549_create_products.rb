class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.text :description
      t.string :start_time
      t.string :end_time
      t.string :image_url
      t.text :comment

      t.timestamps
    end
  end
end
