class AddNicknamesToPeople < ActiveRecord::Migration
  def change
    add_column :people, :nickname, :string
  end
end