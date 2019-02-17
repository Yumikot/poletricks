class CreateTricks < ActiveRecord::Migration[5.2]
  def change
    create_table :tricks do |t|
      t.string :title
      t.binary :image
      t.string :video

      t.timestamps
    end
  end
end
