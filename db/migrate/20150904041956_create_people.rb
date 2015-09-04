class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.text :food_requirements
      t.text :song_requests
      t.boolean :attending_rehearsal_dinner, :allow_null => false, :default => false
      t.boolean :attending_wedding, :allow_null => false, :default => false
      t.belongs_to :household
      t.string :email_address

      t.timestamps null: false
    end
  end
end
