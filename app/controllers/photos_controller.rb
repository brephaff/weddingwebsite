class PhotosController < ApplicationController
  def index
    @photos = Photo.accepted
  end

  def create(*args)
    FileUploader.config.enable_processing = false
    Photo.create!(:attachment => open(params[:url]))
    render :nothing => true
  ensure
    FileUploader.config.enable_processing = true
  end

  private

  def photo_params
    params.fetch(:photo, {}).permit(:description)
  end
end
