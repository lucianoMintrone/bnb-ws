class BookbnbForbiddenError < BookbnbError
	def initialize(error: 'forbidden', error_message: "You don\'t have permission to access on this server")
		super error, error_message, 403
	end
end