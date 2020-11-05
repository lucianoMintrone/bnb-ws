class RoomsController < ApplicationController
	def create
		room = Room.create! create_params
		if params[:image].present?
			room.image.attach(params[:image])
		end
		render_object room
	end

	private
	def create_params
		params.permit(:name, :description, :number_of_guests, :price_per_night, :longitude, 
			:latitude, :room_type_id
		).merge({ host: current_host })
	end
end