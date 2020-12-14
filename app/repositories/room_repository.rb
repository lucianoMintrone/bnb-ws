class RoomRepository
	def list(filter_by:)
		rooms = Room.not_blocked
		rooms = RoomFilterer.new(filter_by, rooms).execute if filter_by
		rooms
	end
end