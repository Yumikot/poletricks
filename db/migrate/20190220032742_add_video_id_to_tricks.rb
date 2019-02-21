class AddVideoIdToTricks < ActiveRecord::Migration[5.2]
  def change
    add_column :tricks, :video_id, :string
  end
end
