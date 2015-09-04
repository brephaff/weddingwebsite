class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string :street_address
      t.string :street_address2
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code
      t.date :arrival_date
      t.date :departure_date
      t.boolean :invitation_sent, :allow_null => false, :default => false
      t.boolean :thank_you_sent, :allow_null => false, :default => false
      t.text :gift

      t.timestamps null: false
    end
  end
end
