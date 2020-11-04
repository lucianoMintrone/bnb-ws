class BookbnbUnauthorizedError < BookbnbError
	def initialize
		error = 'unauthorized'
		error_message = "Authorization Required"
		super error, error_message, 401
	end
end