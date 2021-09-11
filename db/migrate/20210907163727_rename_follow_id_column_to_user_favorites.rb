class RenameFollowIdColumnToUserFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_favorites, :follow_id, :following_id
  end
end
