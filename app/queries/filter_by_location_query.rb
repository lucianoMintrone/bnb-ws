class FilterByLocationQuery < BaseQuery
	def initialize(value)
		@value = value
	end

	def execute_for(relation)
		relation.within(radius, :origin => [latitude, longitude])
	end

	private
	def radius
		@value[:radius] || 10
	end

	def latitude
		@value[:latitude]
	end

	def longitude
		@value[:longitude]
	end
end
