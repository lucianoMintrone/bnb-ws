class RoomsController < ApiController
	def create
		room_params = create_params
		if should_connect_to_payments_server?
			room_response = create_room_in_payments_ws
			room_params = room_params.merge( { hash_id: room_response["hashId"] } )
		end
		room = Room.create! room_params
		update_image_for_room(room)
		render_object room
	end

	def destroy
		room = Room.find(params[:id])
		room.destroy!
		render_object room
	end

	def index
		render_collection GetModels.new(repository: RoomRepository.new, filter_by: filter_by).execute, { include: [:host, :room_type, [comments: :user], :images, :image_url] }
	end

	def index_for_host
		render_collection current_host.rooms
	end

	def show
		room = Room.find(params[:id])
		VisitedRoom.find_or_create_by(guest: current_guest, room: room) if user != room.host.user
		render_object room, { include: [:host, :room_type, [comments: :user], :images, :image_url] }
	end

	def update
		room = Room.find(params[:id])
		room.update! update_params
		update_image_for_room(room)
		render_object room
	end

	private
	def create_room_in_payments_ws
		response = RestClient.post('https://calm-oasis-56692.herokuapp.com/room', 
			{ creatorId: user.wallet.external_id, price: (params[:price_per_night].to_f / 48331.35).round(5) }.to_json, 
			{ content_type: :json, accept: :json } 
		)
		JSON.parse response
	end

	def create_params
		update_params.merge({ host: current_host })
	end

	def update_params
		params.permit(:name, :description, :number_of_guests, :price_per_night, :longitude, 
			:latitude, :room_type_id, :available_from, :available_to
		)
	end

	def update_image_for_room(room)
		room.images.purge
		return unless params[:image].present? || params[:images].present?
		images = [params[:image]]
		images.append params[:images]
		images.compact.each { |image| room.images.attach(image) }
	end

	def filter_by
		params[:filter_by]&.to_unsafe_h&.deep_symbolize_keys
	end
end