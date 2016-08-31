class PhotosController < ApplicationController
  def index
    @photos = Photo.accepted.order(:id => :desc)
  end

  def create(*args)
    Photo.create!(:original_url => params[:url])
    render :nothing => true
  end

  private

  def photo_params
    params.fetch(:photo, {}).permit(:description)
  end
end
