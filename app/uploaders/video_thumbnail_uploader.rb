class VideoThumbnailUploader < ImageUploader

  # process resize_to_fit: [1014, 2028]

  version :thumb do
    process :resize_to_fit => [420, 280]
  end

end
