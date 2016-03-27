require 'person_import'

class Admin::PeopleController < Admin::ApplicationController
  def index
    @people = Person.order(household_id: :asc, first_name: :asc)
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    @person.save!
    redirect_to(admin_people_path)

  rescue ActiveRecord::RecordInvalid
    render(:new)
  end

  def upload
    PersonImport.from_xlsx(params[:file].path, :sheet_name => 'Head Count')
    redirect_to(admin_people_path)
  end

  private

  def person_params
    params.require(:person).permit(:first_name)
  end
end
