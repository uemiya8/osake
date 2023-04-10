class AddGenreIdToLiquors < ActiveRecord::Migration[6.1]
  def change
    add_column :liquors, :genre_id, :integer
  end
end
