class FirebaseUser
	def initialize(token:)
		raise BookbnbUnauthorizedError.new unless token
		@token = token
	end

	def id
		token_payload[:firebase_id]
	end

	def email
		token_payload[:email]
	end

	private
	def token_payload
		@token_payload ||= JWT.decode(@token, hmac_secret, true, { algorithm: 'HS256' }).first.symbolize_keys!
	rescue JWT::VerificationError
		raise BookbnbError.new 'jwt_token_error', 'Invalid token signature'
	rescue JWT::ExpiredSignature
		raise BookbnbError.new 'jwt_token_error', 'Token has expired'
	end

	def hmac_secret
		'top-secret-phrase'
	end
end