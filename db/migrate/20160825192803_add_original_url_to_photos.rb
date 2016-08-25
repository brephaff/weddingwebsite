class AddOriginalUrlToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :original_url, :text
  end
end
