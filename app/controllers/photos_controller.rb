class PhotosController < ApplicationController
  def index
    @photos = Photo.accepted
  end

  def create(*args)
    Photo.delay.create!(:attachment => open(params[:url]))
    render :nothing => true
  end

  private

  def photo_params
    params.fetch(:photo, {}).permit(:description)
  end
end
