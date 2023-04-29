class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :genre_id, null: false
      t.integer :customer_id, null: false
      t.text :comment, null: false
      t.string :liquor_name, null: false
      t.float :liquor_content, null: false
      t.timestamps
    end
  end
end
