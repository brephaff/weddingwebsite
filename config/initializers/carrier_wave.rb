CarrierWave.configure do |config|
  config.storage = Rails.configuration.x.carrier_wave.storage
  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku

  case Rails.configuration.x.carrier_wave.storage.to_sym
  when :fog
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => Rails.application.secrets.s3_key,
      :aws_secret_access_key => Rails.application.secrets.s3_secret
    }

    config.fog_directory    = Rails.application.secrets.s3_bucket_name
  end
end

S3DirectUpload.config do |c|
  # c.access_key_id = Rails.application.secrets.s3_key # your access key id
  # c.secret_access_key = Rails.application.secrets.s3_secret # your secret access key
  # c.bucket = Rails.application.secrets.s3_bucket_name # your bucket name

c.access_key_id = 'AKIAIXCJJT7HZ5BYQCXA'
c.secret_access_key = 'e1mUe7IGIiH9F3EXj17dak8/zX7sDAm8yna1Hxy1'
c.bucket = 'nickandbrewedding'
end
