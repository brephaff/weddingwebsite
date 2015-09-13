class Person < ActiveRecord::Base
  belongs_to :household

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :first_name, :scope => :last_name


  def reset_choices!
    update_attributes(:attending_wedding => nil, :attending_rehearsal_dinner => nil, :food_requirements => nil, :song_requests => nil)
  end
end
