class RecommendRooms
	def self.execute
		Room.create!(number_of_guests: 3, price_per_night: 120, latitude: -34.5969877, longitude: -58.5004788,
			room_type_id: 1, name: 'Probando cronjob', host: Host.first
		)
	end
end