class Photo < ActiveRecord::Base
  mount_uploader :file, FileUploader

  scope :pending, lambda { where(:accepted => false) }
  scope :accepted, lambda { where(:accepted => true) }
end
