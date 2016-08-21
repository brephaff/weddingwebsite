class AddAcceptedToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :accepted, :boolean, :null => false, :default => false
  end
end
