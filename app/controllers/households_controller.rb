class HouseholdsController < ApplicationController

  def index
    render :lookup
  end

  def lookup
    if params[:name]
      redirect_to [:edit, Household.find_by_person_name(params[:name])]
    end

  rescue ActiveRecord::RecordNotFound
    @lookup_failure = true
  end

  def edit
    @household = Household.find(params[:id])
  end

  def update
    @household = Household.find(params[:id])
    @household.update_attributes!(household_params)
  end

  private

  def household_params
    params.require(:household).permit(:people_attributes => [:id, :food_requirements, :song_requests, :attending_wedding, :attending_rehearsal_dinner])
  end
end
