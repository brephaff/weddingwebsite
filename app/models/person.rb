class Person < ActiveRecord::Base
  belongs_to :household

  validates_presence_of :first_name, :last_name
end
