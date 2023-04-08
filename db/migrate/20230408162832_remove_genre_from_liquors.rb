class RemoveGenreFromLiquors < ActiveRecord::Migration[6.1]
  def change
    remove_column :liquors, :genre, :string
  end
end
