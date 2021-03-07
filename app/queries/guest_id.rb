class GuestId
	def initialize(value)
		@value = value
	end

	def execute_for(relation)
		relation.where(bookings: { guest_id: @value } )
	end
end