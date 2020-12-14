class HealthController < ApiController
	skip_before_action :authorize_user, :validate_user

	def show
		render json: { status: :ok }, status: 200
	end
end
