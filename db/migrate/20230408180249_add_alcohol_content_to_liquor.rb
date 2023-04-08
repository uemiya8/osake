class AddAlcoholContentToLiquor < ActiveRecord::Migration[6.1]
  def change
    add_column :liquors, :alcohol_content, :string
  end
end
