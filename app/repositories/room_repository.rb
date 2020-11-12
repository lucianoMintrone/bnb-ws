class RoomRepository
	def list(filter_by:)
		rooms = Room.all
		rooms = RoomFilterer.new(filter_by, rooms).execute if filter_by
		rooms
	end
end