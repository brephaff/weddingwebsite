class HouseholdsController < ApplicationController

  def lookup
    redirect_to Household.find_by_person_name(params[:name])
  rescue ActiveRecord::RecordNotFound
    redirect_to [Household, params.slice(:first_name, :last_name).merge(:failure => true)]
  end

  def show
    @household = Household.find(params[:id])
  end

  def update
    Household.find(params[:id]).update_attributes!(household_params)

    respond_to do |format|
      format.js { render :nothing => true }
      format.html
    end
  end

  private

  def household_params
    params.require(:household).permit(:people_attributes => [:id, :food_requirements, :song_requests, :attending_wedding, :attending_rehearsal_dinner])
  end
end
