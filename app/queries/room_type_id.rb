class RoomTypeId
	def initialize(value)
		@value = value
	end

	def execute_for(relation)
		FilterByAttributeQuery.new(:room_type_id, @value).execute_for(relation)
	end
end