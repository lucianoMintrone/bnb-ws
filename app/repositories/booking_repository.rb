class BookingRepository
	def list(filter_by:)
		bookings = Booking.joins("LEFT JOIN favorite_bookings ON bookings.id = favorite_bookings.booking_id AND favorite_bookings.guest_id = #{filter_by[:guest_id]}")
		bookings = BookingFilterer.new(filter_by, bookings).execute if filter_by
		bookings
	end
end