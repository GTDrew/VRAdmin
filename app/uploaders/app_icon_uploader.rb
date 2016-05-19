class AppIconUploader < ImageUploader
  process resize_to_fit: [192, 192]

  version :thumb do
    process resize_to_fit: [150, 150]
  end
end
