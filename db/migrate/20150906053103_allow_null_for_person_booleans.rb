class AllowNullForPersonBooleans < ActiveRecord::Migration
  def change
    change_column :people, :attending_wedding, :boolean, :allow_null => true
    change_column :people, :attending_rehearsal_dinner, :boolean, :allow_null => true
    remove_column :people, :submitted
  end
end
