class AddPostIdToLiquor < ActiveRecord::Migration[6.1]
  def change
    add_column :liquors, :post_id, :integer
  end
end
