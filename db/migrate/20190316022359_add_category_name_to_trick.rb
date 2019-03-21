class AddCategoryNameToTrick < ActiveRecord::Migration[5.2]
  def change
    add_column :tricks, :category_name, :string
  end
end
