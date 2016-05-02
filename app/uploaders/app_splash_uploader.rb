class AppSplashUploader < ImageUploader

    process resize_to_fit: [1014, 2028]

    version :thumb do
      process :resize_to_fit => [240, 400]
    end

end
