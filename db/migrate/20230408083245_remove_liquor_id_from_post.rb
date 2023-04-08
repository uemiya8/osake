class RemoveLiquorIdFromPost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :liquor_id, :string
  end
end
