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
end