class RemoveTagListFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :tag_list, :string
  end
end
