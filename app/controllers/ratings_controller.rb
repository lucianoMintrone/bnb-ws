class RatingsController < ApiController
	def create_for_booking
		booking = Booking.find(params[:booking_id])
		room = booking.room
		rate = params[:rate]
		rating = Rating.create! rateable: booking, rate: rate, comment: params[:comment]
		room.increment! :number_of_ratings
		room.increment! :total_rating, rate.to_f
		render_object rating
	end

	def create_for_guest
		guest = Guest.find(params[:guest_id])
		rate = params[:rate]
		rating = Rating.create! rateable: guest, rate: rate, comment: params[:comment]
		guest.increment! :number_of_ratings
		guest.increment! :total_rating, rate.to_f
		render_object rating
	end
end