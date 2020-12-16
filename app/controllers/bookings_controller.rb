class BookingsController < ApiController
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
		render_collection Booking.where(guest_id: user.guest.id)
	end

	def mark_as_favorite
		favorited_booking = FavoriteBooking.find_or_create_by(guest_id: user.guest.id, booking_id: params[:booking_id])
		render_object favorited_booking
	end
end