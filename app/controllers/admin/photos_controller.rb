require 'open-uri'

class Admin::PhotosController < Admin::ApplicationController
  def index
    @photos = Photo.order(:id => :desc)
  end

  def accept
    accept_photo(Photo.find(params[:id]))

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render :nothing => true }
    end
  end

  def accept_all
    Photo.pending.find_each do |photo|
      accept_photo(photo)
    end

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

  private

  def accept_photo(photo)
    photo.update_attributes(:accepted => true, :attachment => open(photo.original_url))
    photo.attachment.recreate_versions!
  end
end
