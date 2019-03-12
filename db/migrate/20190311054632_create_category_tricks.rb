class CreateCategoryTricks < ActiveRecord::Migration[5.2]
  def change
    create_table :category_tricks do |t|
      t.references :trick, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
