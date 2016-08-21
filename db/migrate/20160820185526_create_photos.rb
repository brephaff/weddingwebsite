class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file
      t.text :description
      t.string :contact_info
      t.string :ip_address
      t.timestamps :null => false
    end
  end
end
