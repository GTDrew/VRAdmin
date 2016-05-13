class Api::V1::AppsController < ApplicationController

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

	def info
		@videos = @app.videos
		render 'apps/show', formats: [:json], handlers: [:jbuilder]
	end

	private

	def set_app_code
		@app_code = request.headers['AUTH-TOKEN']
		render json: {errors: [%{Header "AUTH-TOKEN" is required.}]}, status: :unauthorized if @app_code.nil?
	end

	def set_app
		@app = App.find_by(code: @app_code)
		# @app.id == params[:id].to_i ? @app : @app.name =''
		render(json: {errors: [%{Invalid AUTH-TOKEN}]}, status: :unauthorized) and return unless @app.valid?
	end

end
