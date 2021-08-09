class CreateUserFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :user_favorites do |t|
      t.integer :user_id
      t.integer :follow_id, foreign_key: {to_table: :users}

      t.timestamps

      t.index [:user_id, :follow_id], unique: true
    end
  end
end
