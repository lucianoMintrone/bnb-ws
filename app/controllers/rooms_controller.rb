class RoomsController < ApplicationController
	def create
		room = Room.create! create_params
		if params[:image].present?
			room.image.attach(params[:image])
		end
		render_object room
	end

	def index
		if params[:radius] && params[:current_latitude] && params[:current_longitude]
			rooms = Room.within(params[:radius], :origin => [params[:current_latitude], params[:current_longitude]])
		else 
			rooms = Room.all
		end
		render_collection rooms
	end

	def index_for_host
		render_collection current_host.rooms
	end

	def update
		room = Room.find(params[:id])
		room.update! update_params
		if params[:image].present?
			user.image.purge
			room.image.attach(params[:image])
		end
		render_object room
	end

	private
	def create_params
		update_params.merge({ host: current_host })
	end

	def update_params
		params.permit(:name, :description, :number_of_guests, :price_per_night, :longitude, 
			:latitude, :room_type_id
		)
	end
end