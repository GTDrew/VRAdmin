class DashboardController < ApplicationController
  def index
    @app = current_user.app if current_user && current_user.app
  end
end
