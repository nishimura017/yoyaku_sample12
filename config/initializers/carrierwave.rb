require 'carrierwave/processing/mini_magick'

CarrierWave.configure do |config|
  config.storage = :file
  config.enable_processing = true
end

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :profile_image do
    process resize_to_fill: [40, 40]
  end
end
