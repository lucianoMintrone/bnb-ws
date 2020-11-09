class Location
	def initialize(value)
		@value = value
	end

	def execute_for(relation)
		FilterByLocationQuery.new(@value).execute_for(relation)
	end
end