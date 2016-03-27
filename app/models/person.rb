class Person < ActiveRecord::Base
  belongs_to :household

  validates_presence_of :first_name, :last_name, :household
  validates_uniqueness_of :first_name, :scope => :last_name

  delegate :street_address, :street_address2, :city, :province, :country, :postal_code, :to => :household, :allow_nil => true

  def name
    first_name + " " + last_name
  end

  def reset_choices!
    update_attributes(:attending_wedding => nil, :attending_rehearsal_dinner => nil, :food_requirements => nil, :song_requests => nil)
  end
end
