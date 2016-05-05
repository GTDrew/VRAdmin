class AppsController < ApplicationController
  layout "app"

  before_action :authenticate_user!
  before_action :require_owner, :except => [:new, :create]

  def show
    @app = App.find(params[:id])
  end

  def new
    @app = App.new
  end

  def edit
    @app = App.find(params[:id])
  end

  def create
    @app = App.new(app_params)
    @app.user_id = current_user.id

    if @app.save
      flash[:notice] = 'App successfully created!'
      redirect_to app_path(@app)
    else
      render 'new'
    end
  end

  def update
    @app = App.find(params[:id])

    if @app.update(app_params)
      flash[:notice] = 'App successfully updated!'
      redirect_to @app
    else
      render 'edit'
    end
  end

  def destroy
    @app = App.find(params[:id])
    @app.destroy

    redirect_to apps_path
  end

  def preview_iphone
    @app = App.find(params[:id])
    @videos = @app.videos
    @video = @videos.first
  end

  def preview_android
    @app = App.find(params[:id])
    @videos = @app.videos
    @video = @videos.first
  end

  private
  def app_params
    params.require(:app).permit(:name, :icon, :header_image, :splash_image, :background_color, :font_color)
  end
end
