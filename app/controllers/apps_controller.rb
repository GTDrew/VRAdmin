class AppsController < ApplicationController
  require 'rubygems'
  require 'zip'
  require 'open-uri'
  layout "app"

  before_action :authenticate_user!
  before_action :require_owner, :except => [:new, :create]

  def show
    @app = App.find(params[:id])

    respond_to do |format|
      format.html
      format.zip do

        compressed_filestream = Zip::OutputStream.write_buffer do |zos|

          zos.put_next_entry "title_icon.png"
          zos.write open(@app.header_image.url).read

          zos.put_next_entry "ic_launcher.png"
          zos.write open(@app.icon.url).read

          zos.put_next_entry "splash_icon.png"
          zos.write open(@app.splash_image.url).read
        end
        compressed_filestream.rewind
        send_data compressed_filestream.read, filename: "#{@app.name}-#{@app.id}.zip"
      end
    end
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
      flash[:error] = @app.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def update
    @app = App.find(params[:id])

    if @app.update(app_params)
      flash[:notice] = 'App successfully updated!'
      redirect_to @app
    else
      flash[:error] = @app.errors.full_messages.join(', ')
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

  def submit
    @app = App.find(params[:id])
  end

  private
  
  def app_params
    params.require(:app).permit(
      :name,
      :icon,
      :header_image,
      :splash_image,
      :background_color,
      :font_color,
      :splash_color,
      :submitted
      )
  end
end
