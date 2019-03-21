class AddCategoryIdToTrick < ActiveRecord::Migration[5.2]
  def change
    add_column :tricks, :category_id, :integer
  end
end
