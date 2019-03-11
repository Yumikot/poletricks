class CreateCategoryTricks < ActiveRecord::Migration[5.2]
  def change
    create_table :category_tricks do |t|

      t.timestamps
    end
  end
end
