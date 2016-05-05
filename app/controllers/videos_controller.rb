class VideosController < ApplicationController
  layout "app"

  before_action :set_app

  def set_app
    @app = App.find(params[:app_id])
  end

  def index
    @videos = @app.videos
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def edit
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(video_params)
    @video.app_id = @app.id

    if @video.save
      flash[:notice] = 'Video successfully created!'
      redirect_to app_videos_path
    else
      flash[:error] = @video.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def update
    @video = Video.find(params[:id])

    if @video.update(video_params)
      flash[:notice] = 'Video successfully updated!'
      redirect_to app_videos_path
    else
      flash[:error] = @video.errors.full_messages.join(', ')
      render 'edit'
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:notice] = 'Video successfully deleted!'
    redirect_to app_videos_path
  end

  def sort
    params[:order].each do |key,value|
      Video.find(value[:id]).update_attribute(:rank,value[:position])
    end
    render :nothing => true
  end

  private

  def video_params
    params.require(:video).permit(:name, :description, :thumbnail, :video_file, :format, :rank)
  end

end
