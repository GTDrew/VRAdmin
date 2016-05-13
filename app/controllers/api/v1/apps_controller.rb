class Api::V1::AppsController < Api::V1::BaseController

  def info
    @videos = @app.videos
    render 'apps/show', formats: [:json], handlers: [:jbuilder]
  end

end
