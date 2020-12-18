class BookingRepository
	def list(filter_by:)
		bookings = Booking.all
		bookings = BookingFilterer.new(filter_by, bookings).execute if filter_by
		bookings
	end
end