class BookingsController < ApiController
	def accept
		booking = Booking.find(params[:booking_id])
		booking.accepted!
		render_object booking.reload
	end

	def create
		booking = Booking.create!(guest: current_guest, room_id: params[:room_id], 
			from_date: params[:from_date], to_date: params[:to_date], price_per_night: params[:price_per_night]
		)
		render_object booking
	end

	def index_for_room
		render_collection Booking.where(room_id: params[:room_id])
	end

	def index_for_guest
		render_collection GetBookings.new(filter_by: filter_by, guest: user.guest).execute
	end

	def mark_as_favorite
		favorited_booking = FavoriteBooking.find_or_create_by(guest_id: user.guest.id, booking_id: params[:booking_id])
		render_object favorited_booking
	end

	def reject
		booking = Booking.find(params[:booking_id])
		booking.rejected!
		render_object booking.reload
	end

	private
	def filter_by
		params[:filter_by]&.to_unsafe_h&.deep_symbolize_keys || {}
	end
end