class AddGenreIdToLiquor < ActiveRecord::Migration[6.1]
  def change
    add_column :liquors, :genre, :integer
  end
end
