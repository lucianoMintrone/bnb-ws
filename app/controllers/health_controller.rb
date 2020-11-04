class HealthController < ApplicationController
	skip_before_action :authorize_user

	def show
		render json: { status: :ok }, status: 200
	end
end
