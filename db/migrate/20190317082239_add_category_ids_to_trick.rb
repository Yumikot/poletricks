class AddCategoryIdsToTrick < ActiveRecord::Migration[5.2]
  def change
    add_column :tricks, :category_ids, :integer
  end
end
