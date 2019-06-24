class AddImpressionsCountToTricks < ActiveRecord::Migration[5.2]
  def change
    add_column :tricks, :impressions_count, :integer
  end
end
