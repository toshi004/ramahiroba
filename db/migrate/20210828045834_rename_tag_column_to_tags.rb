class RenameTagColumnToTags < ActiveRecord::Migration[5.2]
  def change
    rename_column :tags, :tag, :tag_name
  end
end
