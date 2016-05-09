class AppHeaderUploader < ImageUploader

  process resize_to_fit: [149, 64]

end
