class VideoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    if Rails.env.development?
      "uploads/development/apps/#{model.app_id}/#{mounted_as}/"
    else
      "uploads/production/apps/#{model.app_id}/#{mounted_as}/"
    end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(mp4)
  end

  def filename
    "#{model.name}-#{model.created_at.strftime('%m-%e-%y-%H-%M-%S')}.mp4"
  end
end
