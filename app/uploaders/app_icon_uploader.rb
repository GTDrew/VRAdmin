class AppIconUploader < ImageUploader

  version :thumb do
    process :resize_to_fit => [150, 150]
  end

end
