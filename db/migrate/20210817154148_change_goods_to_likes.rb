class ChangeGoodsToLikes < ActiveRecord::Migration[5.2]
  def change
    rename_table :goods, :likes
  end
end
