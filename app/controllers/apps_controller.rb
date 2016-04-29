class AppsController < ApplicationController
  layout "app"

  def index
    @app = App.all
  end

  def show
    @app = App.find(params[:id])
    @user = current_user
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
    byebug
    if @app.save
      redirect_to app_path(@app)
    else
      render 'new'
    end
  end

  def update
    @app = App.find(params[:id])

    # respond_to do |format|
    #   if @app.update(app_params)
    #     # format.html { redirect_to(@app, :notice => 'App was successfully updated.') }
    #     format.json { respond_with_bip(@app) }
    #   else
    #     format.html { render :action => "edit" }
    #     format.json { respond_with_bip(@app) }
    #   end
    # end

    if @app.update(app_params)
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

  def preview
    @app = App.find(params[:id])
  end

  private
  def app_params
    params.require(:app).permit(:name, :icon, :header_image, :splash_image, :background_color, :font_color)
  end
end
