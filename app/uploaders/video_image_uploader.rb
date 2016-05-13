class VideoImageUploader < ImageUploader

  # process resize_to_fit: [1014, 2028]

  def store_dir
    if Rails.env.development?
      "uploads/development/apps/#{model.app_id}/#{mounted_as}/"
    else
      "uploads/production/apps/#{model.app_id}/#{mounted_as}/"
    end
  end

  version :thumb do
  	process :resize_to_fit => [420, 280]
  end

end
