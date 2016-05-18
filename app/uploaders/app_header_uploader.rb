class AppHeaderUploader < ImageUploader

	# process resize_to_fit: [149, 64]

	# before :cache, :capture_size_before_cache # callback, example here: http://goo.gl/9VGHI
  
	# def capture_size_before_cache(new_file) 
	# 	if model.header_image_width.nil? || model.header_image_height.nil?
	# 		# model.avatar_upload_width, model.avatar_upload_height = `identify -format "%wx %h" #{new_file.path}`.split(/x/).map { |dim| dim.to_i }

 #      model.header_image_width, model.header_image_height = `identify -format "%wx %h" #{new_file.path}`.split(/x/).map { |dim| dim.to_i }
	# 	end
 #  end

end