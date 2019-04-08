class AddJaTitleToTricks < ActiveRecord::Migration[5.2]
  def change
    add_column :tricks, :ja_title, :string
  end
end
