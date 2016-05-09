json.set! :app do
  json.extract! @app, :id, :name, :background_color, :font_color, :submitted, :user_id

  json.icon do
    json.url @app.icon.url
  end

  json.header_image do
    json.url @app.header_image.url
  end

  json.splash_image do
    json.url @app.splash_image.url
  end

end

json.set! :videos do
  json.array!(@videos) do |video|
    json.extract! video, :id, :name, :description, :format, :rank

    json.video_file do
      json.url video.video_file.url
      json.size video.video_file.size
    end

    json.image do
      json.url video.image.url
      json.size video.image.size
    end
  end
end
