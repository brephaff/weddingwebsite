require 'person_import'

class Admin::PeopleController < Admin::ApplicationController
  def index
    @people = Person.includes(:household).order(household_id: :asc, first_name: :asc)
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

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @person.update_attributes!(person_params)
    redirect_to(admin_people_path)

  rescue ActiveRecord::RecordInvalid
    render(:edit)
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to(admin_people_path)
  end

  def upload
    PersonImport.from_xlsx(params[:file].path, :sheet_name => 'Head Count')
    redirect_to(admin_people_path)
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :nickname, :email_address, :title, :household_id, :attending_wedding, :food_requirements, :song_requests)
  end
end
