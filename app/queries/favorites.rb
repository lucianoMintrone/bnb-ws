class Favorites
	def initialize(value)
		@value = value
	end

	def execute_for(relation)
		relation.where(id: FavoriteBooking.where(guest: @value).pluck(:booking_id))
	end
end