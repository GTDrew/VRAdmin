class AppSplashUploader < ImageUploader
  # process resize_to_fit: [640, 960]

  version :thumb do
    process resize_to_fit: [240, 400]
  end
end
