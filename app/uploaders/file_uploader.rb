class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :fix_exif_rotation

  version(:small)    { process(:resize_to_fill => [200, 200]) }
  version(:medium)   { process(:resize_to_fill => [400, 400]) }
  version(:large)    { process(:resize_to_fill => [1024, 768]) }
  version(:full)     { process(:resize_to_fit => [1024, 768]) }

  def fix_exif_rotation
    manipulate! do |img|
      img.auto_orient!
      img = yield(img) if block_given?
      img
    end
  end
end
