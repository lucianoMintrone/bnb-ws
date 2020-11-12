class NumberOfGuests
	def initialize(value)
		@value = value
	end

	def execute_for(relation)
		FilterByAttributeQuery.new(:number_of_guests, @value).execute_for(relation)
	end
end