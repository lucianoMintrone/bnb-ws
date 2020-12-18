class GetBookings
	def initialize(filter_by:, guest:)
		@filter_by = filter_by
		@guest = guest
	end

	def execute
		get_bookings
	end

	private
	def get_bookings
		repository.list filter_by: filter_by
	end

	def filter_by
		filter = @filter_by.merge( { guest_id: @guest.id } )
		filter.merge!( { favorites: @guest } ) if @filter_by[:favorites].present?
		filter
	end

	def repository
		BookingRepository.new
	end
end