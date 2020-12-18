class GuestId
	def initialize(value)
		@value = value
	end

	def execute_for(relation)
		FilterByAttributeQuery.new(:guest_id, @value).execute_for(relation)
	end
end