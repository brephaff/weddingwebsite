class Household < ActiveRecord::Base
  has_many :people, lambda { order :first_name, :last_name }

  accepts_nested_attributes_for :people
  validates_presence_of :street_address, :city, :province, :country, :postal_code

  obfuscate_id

  def self.find_by_person_name(name)
    joins(:people).where("LOWER(first_name || ' ' || last_name) = ?", name.squish.downcase).first!
  end

  def self.find_by_first_and_last_name(first_name, last_name)
    joins(:people)
      .where('LOWER(first_name) = ?', first_name.strip.downcase)
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
