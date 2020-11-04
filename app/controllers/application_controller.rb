class ApplicationController < ActionController::Base
	include ResponseRenderer

	before_action :authorize_user
	skip_before_action :verify_authenticity_token

	rescue_from ::BookbnbError, with: :render_bookbnb_error
	rescue_from ::BookbnbUnauthorizedError, with: :render_bookbnb_error
	rescue_from ::ActiveRecord::RecordInvalid, with: :render_invalid_record_error
	rescue_from ::ActiveRecord::RecordNotFound, with: :render_record_not_found_error

	private
	def authorize_user
		raise BookbnbUnauthorizedError.new unless user
	end

	def firebase_user
		@firebase_user ||= FirebaseUser.new(token: request.headers["Authorization"])
	end

	def user
		@user ||= User.find_by_firebase_id(firebase_user.id)
	end

	def current_host
		@current_host ||= host_id == 'me' ? Host.first : Host.find(host_id)
	end

	# def token_payload
	# 	hmac_secret = 'top-secret-phrase'
	# 	@token_payload ||= JWT.decode(jwt_token, hmac_secret, true, { algorithm: 'HS256' }).first.symbolize_keys!
	# end

	# def jwt_token
	# 	request.headers["Authorization"] || (raise BookbnbUnauthorizedError.new)
	# end

	# def firebase_id
	# 	token_payload[:firebase_id]
	# end

	def host_id
		params[:id] || params[:host_id]
	end

	def user_id
		params[:id]
	end
end
