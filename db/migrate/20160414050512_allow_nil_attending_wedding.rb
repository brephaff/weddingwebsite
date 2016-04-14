class AllowNilAttendingWedding < ActiveRecord::Migration
  def up
    change_column(:people, :attending_wedding, :boolean, :allow_null => true, :default => nil)
    Person.update_all(:attending_wedding => nil)
  end

  def down
    change_column(:people, :attending_wedding, :boolean, :allow_null => false, :default => false)
  end
end
