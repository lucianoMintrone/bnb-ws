class PricePerNight
	def initialize(value)
		@value = value
	end

	def execute_for(relation)
		FilterByRangeQuery.new(:price_per_night, @value).execute_for(relation)
	end
end