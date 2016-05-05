class Person < ActiveRecord::Base
  belongs_to :household

  validates_presence_of :first_name, :household
  validates_uniqueness_of :first_name, :scope => [:last_name, :nickname]

  scope :responded, lambda { where.not(:attending_wedding => nil) }
  scope :not_responded, lambda { where(:attending_wedding => nil) }
  scope :attending, lambda { where(:attending_wedding => true) }
  scope :not_attending, lambda { where(:attending_wedding => false) }

  delegate :full_street_address, :city, :province, :country, :postal_code, :to => :household, :allow_nil => true

  def name
    "#{first_name} #{last_name}".squish
  end

  def reset_choices!
    update_attributes(:attending_wedding => nil, :attending_rehearsal_dinner => nil, :food_requirements => nil, :song_requests => nil)
  end
end
