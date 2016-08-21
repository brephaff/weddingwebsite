class Photo < ActiveRecord::Base
  mount_uploader :file, FileUploader

  scope :accepted, lambda { where(:accepted => true) }
end
