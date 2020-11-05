class RoomTypesController < ApplicationController
	def index
		render_collection RoomType.all
	end
end