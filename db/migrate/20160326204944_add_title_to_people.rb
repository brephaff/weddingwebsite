class AddTitleToPeople < ActiveRecord::Migration
  def change
    add_column Person.table_name, 'title', :string
  end
end
