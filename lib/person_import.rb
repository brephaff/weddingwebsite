class PersonImport
  def self.from_xlsx(path, options)
    from_spreadsheet SpreadsheetImporter::Import.from_xlsx(path, options).to_a
  end

  def self.from_spreadsheet(spreadsheet)
    ActiveRecord::Base.transaction do
      people_by_household = Hash.new {|hash, key| hash[key] = [] }

      spreadsheet.each do |attributes, index, row_number|
        person = Person.new do |person|
          puts attributes
          person.title =  attributes['Title']
          person.first_name =  attributes['First Name']
          person.last_name =  attributes['Last Name']
          person.nickname =  attributes['Nickname']
          person.email_address =  attributes['Email']

          # Make a household so we can temporarily store address info for this person
          person.household = Household.new do |household|
            household.street_address =  attributes['Street']
            household.city =  attributes['City']
            household.province =  attributes['Province']
            household.country =  attributes['Country']
            household.postal_code =  attributes['Postal Code']
          end
        end

        # Add the person to the hash under their household so we can later assign all those people to the same household
        people_by_household[attributes['Household']] << person
      end

      # Create and assign households
      people_by_household.each_value do |occupants|
        household = occupants.first.household
        household.save!
        occupants.each do |occupant|
          occupant.household = household
          puts occupant.attributes
          occupant.save!
        end
      end
    end
  end
end
