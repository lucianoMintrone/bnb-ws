class BookingsController < ApiController
	def accept
		booking = Booking.find(params[:booking_id])
		booking.accepted!
		render_object booking.reload
	end

	def create
		room = Room.find params[:room_id]
		from_date = params[:from_date]
		to_date = params[:to_date]
		create_booking_in_payments_ws(room, from_date, to_date)
		booking = Booking.create!(guest: current_guest, room: room, 
			from_date: from_date, to_date: to_date
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
	def create_booking_in_payments_ws(room, from_date_string, to_date_string)
		from_date = from_date_string.to_date
		to_date = to_date_string.to_date
		RestClient.post('https://calm-oasis-56692.herokuapp.com/bookIntent', 
			{ 
				creatorId: user.wallet.external_id, roomHash: room.hash_id, startDay: from_date.day,
				startMonth: from_date.month, startYear: from_date.year, endDay: to_date.day, endMonth: to_date.month,
				endYear: to_date.year, days: ( (to_date - from_date).to_i + 1 )
			}.to_json, 
			{ content_type: :json, accept: :json } 
		)
	end

	def filter_by
		params[:filter_by]&.to_unsafe_h&.deep_symbolize_keys || {}
	end
end