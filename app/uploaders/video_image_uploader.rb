class VideoImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  def store_dir
    if Rails.env.development?
      "uploads/development/apps/#{model.app_id}/#{mounted_as}/"
    else
      "uploads/production/apps/#{model.app_id}/#{mounted_as}/"
    end
  end

  version :thumb do
    process resize_to_fit: [420, 280]
  end

  version :normal do
    process :efficient_conversion
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

  def filename
    "#{model.name.underscore}.png"
  end

  private

  def efficient_conversion
    manipulate! do |img|
      img.format('png') do ||
      end
      img
    end
  end
end
