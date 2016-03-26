class Admin::PeopleController < Admin::ApplicationController
  def index
    @people = Person.order(household_id: :asc, first_name: :asc)
  end

  def upload
    @spreadsheet = SpreadsheetImporter::Import.from_xlsx(params[:file].path).to_a
  end
end
