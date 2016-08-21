class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def create
    Array(params[:file]).each do |file|
      Photo.create(photo_params.merge(:file => file))
    end

    respond_to do |format|
      format.html {  }
      format.json { render :nothing => true }
    end
  end

  private

  def photo_params
    params.fetch(:photo, {}).permit(:description)
  end
end
