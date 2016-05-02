class AppHeaderUploader < ImageUploader

  process resize_to_fit: [150, 45]

end
