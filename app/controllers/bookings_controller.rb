require 'fcm'

class BookingsController < ApiController
	def accept
		booking = Booking.find(params[:booking_id])
		accept_booking_in_payments_ws(booking) if should_connect_to_payments_server?
		booking.accepted!
		send_booking_accepted_push_notification booking
		render_object booking.reload
	end

	def create
		room = Room.find params[:room_id]
		from_date = params[:from_date]
		to_date = params[:to_date]
		create_booking_in_payments_ws(room, from_date, to_date) if should_connect_to_payments_server?
		booking = Booking.create!(guest: current_guest, room: room, 
			from_date: from_date, to_date: to_date
		)
		send_new_booking_push_notification booking
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
		reject_booking_in_payments_ws(booking) if should_connect_to_payments_server?
		booking.rejected!
		render_object booking.reload
	end

	def show
		render_object Booking.find(params[:id]), { include: [ guest: :user, room: [ host: :user ] ] }
	end

	private
	def accept_booking_in_payments_ws(booking)
		room = booking.room
		from_date = booking.from_date
		to_date = booking.to_date
		RestClient.post('https://calm-oasis-56692.herokuapp.com/bookAccept', 
			{ 
				bookerId: booking.guest.user.wallet.external_id, roomHash: room.hash_id, startDay: from_date.day,
				startMonth: from_date.month, startYear: from_date.year, endDay: to_date.day, endMonth: to_date.month,
				endYear: to_date.year
			}.to_json, 
			{ content_type: :json, accept: :json } 
		)
	end
	
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

	def reject_booking_in_payments_ws(booking)
		room = booking.room
		from_date = booking.from_date
		to_date = booking.to_date
		RestClient.post('https://calm-oasis-56692.herokuapp.com/bookReject', 
			{ 
				bookerId: booking.guest.user.wallet.external_id, roomHash: room.hash_id, startDay: from_date.day,
				startMonth: from_date.month, startYear: from_date.year, endDay: to_date.day, endMonth: to_date.month,
				endYear: to_date.year
			}.to_json, 
			{ content_type: :json, accept: :json } 
		)
	end

	def filter_by
		params[:filter_by]&.to_unsafe_h&.deep_symbolize_keys || {}
	end

	def send_new_booking_push_notification(booking)
		options = { 
			priority: 'high',
			collapse_key: 'new_booking',
			data: { booking_id: booking.id },
			notification: { 
				body: 'Entrá a la app para ver quién quiere reservar tu alojamiento!!',
				title: 'Nueva reserva',
				sound: 'default'
			}
		}
		fcm_client.send(booking.room.host.user.firebase_token, options)
	end

	def send_booking_accepted_push_notification(booking)
		options = { 
			priority: 'high',
			collapse_key: 'booking_accepted',
			data: { booking_id: booking.id },
			notification: { 
				body: 'Prepará las valijas, el anfitrión confirmó tu reserva!!',
				title: 'Reserva confirmada',
				sound: 'default'
			}
		}
		fcm_client.send(booking.guest.user.firebase_token, options)
	end



	def send_chat_notification()

	end

	def fcm_client
		FCM.new("AAAAgIgUnn8:APA91bGu3L9vqrfv8CYdC_AZodVtJH0z4gBqAfThpBTedaH9FnX4Go3Www1EOYAktWS08iSx1-uKsxIcmNfPTkWsnQFKOJyGExSTNS9MTj3NCGe0n8jJsLvg3p5xzcPJ2MFTafNXvWm0")
	end
end