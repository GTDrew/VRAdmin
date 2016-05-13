class LoginApp
  attr_reader :app, :app_code

  def initialize(app_code, app_id)
    @app = App.find_by_id(app_id)
    @app_code = App.find_by_code(app_code)
  end

  def valid?
    (@app && @app_code)
  end
end