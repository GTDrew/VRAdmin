class Api::V1::AppsController < ApplicationController
  respond_to :json

  def info
    @app = App.find_by(id: params[:id])
    @videos = @app.videos
    respond_with [app: @app, videos: @videos]
  end

end
