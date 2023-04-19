class RemoveLiquorFromLiquors < ActiveRecord::Migration[6.1]
  def change
    remove_column :liquors, :liquors, :string
  end
end
