class AddColumnToTricks < ActiveRecord::Migration[5.2]
  def change
    add_column :tricks, :user_id, :string
  end
end
