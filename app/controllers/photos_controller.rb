class PhotosController < ApplicationController
  def index
    @photos = Photo.accepted
  end

  def create(*args)
    FileUploader.enable_processing = false
    Photo.create!(:attachment => open(params[:url]))
    render :nothing => true
  ensure
    FileUploader.enable_processing = true
  end

  private

  def photo_params
    params.fetch(:photo, {}).permit(:description)
  end
end
