class Api::V1::AppsController < ApplicationController

  def info
    @app = App.find_by(id: params[:id])
    @videos = @app.videos
    render 'apps/show', formats: [:json], handlers: [:jbuilder]
  end

end
