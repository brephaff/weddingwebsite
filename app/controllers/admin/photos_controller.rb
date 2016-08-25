require 'open-uri'

class Admin::PhotosController < Admin::ApplicationController
  def index
    @photos = Photo.order(:id => :desc)
  end

  def accept
    @photo = Photo.find(params[:id])
    @photo.update_attributes(:accepted => true, :attachment => open(@photo.original_url))
    @photo.attachment.recreate_versions!

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render :nothing => true }
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render :nothing => true }
    end
  end
end
