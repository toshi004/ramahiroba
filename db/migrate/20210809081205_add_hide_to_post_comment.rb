class AddHideToPostComment < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :hide, :boolean
    add_column :post_comments, :report, :boolean
  end
end
