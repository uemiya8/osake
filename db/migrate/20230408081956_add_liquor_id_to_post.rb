class AddLiquorIdToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :liquor_id, :string
  end
end