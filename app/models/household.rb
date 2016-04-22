class Household < ActiveRecord::Base
  has_many :people, lambda { order :first_name, :last_name }

  accepts_nested_attributes_for :people
  validates_presence_of :street_address, :city, :country

  obfuscate_id

  def self.find_by_person_name(full_name)
    first_name, last_name = full_name.split
    first_name = first_name.to_s
    last_name = last_name.to_s
    joins(:people)
      .where('LOWER(first_name) = ? OR LOWER(nickname) = ?', first_name.strip.downcase, first_name.strip.downcase)
      .where('LOWER(last_name) = ?', last_name.strip.downcase)
      .first!
  end

  def name
    "Household #{id} (#{people.collect(&:name).to_sentence})"
  end

  def full_street_address
    "#{street_address}\n#{street_address2}".squish
  end
end
