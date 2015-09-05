class AddSubmittedToPerson < ActiveRecord::Migration
  def change
    add_column :people, :submitted, :boolean, :allow_null => false, :default => false
  end
end
