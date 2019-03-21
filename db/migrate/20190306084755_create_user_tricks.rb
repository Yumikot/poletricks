class CreateUserTricks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tricks do |t|
      t.references :user, foreign_key: true
      t.references :trick, foreign_key: true

      t.timestamps
    end
  end
end
