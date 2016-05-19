class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def require_owner
    @app = App.find(params[:id])
    unless current_user == @app.owner || current_user.admin?
      redirect_to app_path(current_user.app)
    end
  end

  helper_method :require_owner

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
    #  devise_parameter_sanitizer.for(:account_update) << :username
  end
end
