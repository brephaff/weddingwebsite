class AutoRotateImages < ActiveRecord::Migration
  def change
    Photo.find_each do |photo|
      photo.attachment.recreate_versions!
    end
  end
end
