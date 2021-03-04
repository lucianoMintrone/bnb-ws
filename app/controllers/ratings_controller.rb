class RatingsController < ApiController
	def create
		booking = Booking.find(params[:booking_id])
		room = booking.room
		rate = params[:rate]
		rating = Rating.create! booking: booking, rate: rate, comment: params[:comment]
		room.increment! :number_of_ratings
		room.increment! :total_rating, rate.to_f
		render_object rating
	end
end