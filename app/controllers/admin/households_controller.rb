class Admin::HouseholdsController < Admin::ApplicationController
  def index
    @households = Household.includes(:people).order(:id)
  end

  def new
    @household = Household.new
  end

  def create
    @household = Household.new(household_params)
    @household.save!
    redirect_to(admin_households_path)

  rescue ActiveRecord::RecordInvalid
    render(:new)
  end

  def edit
    @household = Household.find(params[:id])
  end

  def update
    @household = Household.find(params[:id])
    @household.update_attributes!(household_params)
    redirect_to(admin_households_path)

  rescue ActiveRecord::RecordInvalid
    render(:edit)
  end

  def destroy
    @household = Household.find(params[:id])
    @household.destroy
    redirect_to(admin_households_path)
  end

  private

  def household_params
    params.require(:household).permit(:street_address, :city, :province, :country, :postal_code, :gift)
  end
end
