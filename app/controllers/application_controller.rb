class ApplicationController < ActionController::Base
	# include ResponseRenderer

	# # before_action :authorize_user
	# skip_before_action :verify_authenticity_token

	# rescue_from ::BookbnbError, with: :render_bookbnb_error
	# rescue_from ::ActiveRecord::RecordInvalid, with: :render_invalid_record_error
	# rescue_from ::ActiveRecord::RecordNotFound, with: :render_record_not_found_error

	# private
	# def authorize_user
	# 	raise BookbnbUnauthorizedError.new unless user
	# end

	# def firebase_user
	# 	@firebase_user ||= FirebaseUser.new(token: request.headers["Authorization"])
	# end

	# def user
	# 	@user ||= User.find_by_firebase_id(firebase_user.id)
	# end

	# def current_host
	# 	@current_host ||= host_id == 'me' ? user.host : Host.find(host_id)
	# end

	# def current_guest
	# 	@current_guest ||= user.guest
	# end

	# def host_id
	# 	params[:id] || params[:host_id]
	# end
end
