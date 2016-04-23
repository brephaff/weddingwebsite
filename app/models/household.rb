class Household < ActiveRecord::Base
  has_many :people, lambda { order :first_name, :last_name }

  accepts_nested_attributes_for :people
  validates_presence_of :street_address, :city, :country

  obfuscate_id

  def self.find_by_person_name(full_name)
    full_name = full_name.squish.downcase
    joins(:people)
      .where("LOWER(first_name || ' ' || last_name) = ? OR LOWER(nickname || ' ' || last_name) = ?", full_name, full_name)
      .first!
  end

  def name
    "Household #{id} (#{people.collect(&:name).to_sentence})"
  end

  def full_street_address
    "#{street_address}\n#{street_address2}".squish
  end
end
