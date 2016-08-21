class Photo < ActiveRecord::Base
  mount_uploader :attachment, FileUploader

  scope :pending, lambda { where(:accepted => false) }
  scope :accepted, lambda { where(:accepted => true) }
end
