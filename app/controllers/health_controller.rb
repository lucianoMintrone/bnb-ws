class HealthController < ApplicationController
	def show
		render json: { status: :ok }, status: 200
	end
end
