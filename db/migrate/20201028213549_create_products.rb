class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :address
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :image_url
      t.text :comment
      t.integer :user_id

      t.timestamps
    end
  end
end
