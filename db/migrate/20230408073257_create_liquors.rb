class CreateLiquors < ActiveRecord::Migration[6.1]
  def change
    create_table :liquors do |t|

      t.timestamps
    end
  end
end
