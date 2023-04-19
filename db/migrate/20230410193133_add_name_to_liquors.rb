class AddNameToLiquors < ActiveRecord::Migration[6.1]
  def change
    add_column :liquors, :name, :string
  end
end
