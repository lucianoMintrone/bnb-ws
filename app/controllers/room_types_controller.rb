class RoomTypesController < ApiController
	def index
		render_collection RoomType.all
	end
end