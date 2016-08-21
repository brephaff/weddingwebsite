class RenamePhotoFileToAttachment < ActiveRecord::Migration
  def change
    rename_column :photos, :file, :attachment
  end
end
