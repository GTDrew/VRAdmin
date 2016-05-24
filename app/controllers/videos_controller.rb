class VideosController < ApplicationController
  skip_before_action :verify_authenticity_token
  layout 'app'

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

  # def create
  #   @video = Video.new(video_params)
  #   @video.app_id = @app.id

  #   if @video.save
  #     flash[:notice] = 'Video successfully created!'
  #     redirect_to app_videos_path
  #   else
  #     flash[:error] = @video.errors.full_messages.join(', ')
  #     render 'new'
  #   end
  #  end

  # def create
  #   @video = Video.new(video_create_params)
  #   @video.app_id = @app.id

  #   if @video.save
  #     respond_to do |format|
  #       format.json { render json: [@video.to_jq_upload].to_json }
  #     end
  #   else
  #     render json: [{ error: 'custom_failure' }], status: 304
  #   end
  # end

  def create
    @video = Video.new(video_create_params)
    @video.app_id = @app.id

    respond_to do |format|
      if @video.save
        format.json { render json: { files: [@video.to_jq_upload] },
                             status: :created,
                             location: @video
        }
      else
        format.html { render action: 'new' }
        format.json { render json: @video.errors,
                             status: :unprocessable_entity
        }
      end
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
    params[:order].each do |_key, value|
      Video.find(value[:id]).update_attribute(:rank, value[:position])
    end
    render nothing: true
  end

  private

  def video_create_params
    params.require(:video).permit(:video_file)
  end

  def video_params
    params.require(:video).permit(
      :name,
      :description,
      :image,
      :video_file,
      :format,
      :rank
    )
  end
end
