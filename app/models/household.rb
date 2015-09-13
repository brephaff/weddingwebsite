class Household < ActiveRecord::Base
  has_many :people, lambda { order :first_name, :last_name }

  accepts_nested_attributes_for :people

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
end
