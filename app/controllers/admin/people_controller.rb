class Admin::PeopleController < Admin::ApplicationController
  def upload
    @spreadsheet = SpreadsheetImporter::Import.from_xlsx(params[:file].path).to_a
  end
end
