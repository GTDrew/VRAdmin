class VideosController < ApplicationController
  layout "app"

  def index
    @app = App.find(params[:app_id])
    @videos = @app.videos
  end
end
