class AddLiquorToLiquor < ActiveRecord::Migration[6.1]
  def change
    add_column :liquors, :liquor, :string
  end
end
