module Api
  class BaseController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
    skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
    skip_before_action :authenticate_user!
    before_action :set_app_code
    before_action :set_app

    rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
      error = {}
      error[parameter_missing_exception.param] = ['parameter is required']
      response = { errors: [error] }
      render json: response, status: :unprocessable_entity
    end

    private
    # def set_group_code
    #   @full_code = request.headers['X-GROUP-CODE']
    #   render json: {errors: [%{Header "X-GROUP-CODE" is required.}]}, status: :unauthorized if @full_code.nil?
    # end

    def set_app_code
      @app_code = request.headers['AUTH-TOKEN']
      render json: {errors: [%{Header "AUTH-TOKEN" is required.}]}, status: :unauthorized if @full_code.nil?
    end

    def set_app

      @app = App.find_by(code: @app_code)
      # result = LoginGroup.new(@full_code)
      render(json: {errors: [%{Invalid AUTH-TOKEN}]}, status: :unauthorized) and return unless @app.valid?
      # @group = result.group
      # @group_code = result.group_code
    end
  end
end