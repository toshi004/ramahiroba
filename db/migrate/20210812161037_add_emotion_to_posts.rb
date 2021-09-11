class AddEmotionToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :emotion, :integer
  end
end
