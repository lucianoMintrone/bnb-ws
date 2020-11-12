class FilterByAttributeQuery < BaseQuery
	def initialize(attribute, value)
		@attribute = attribute
		@value = value
	end

	def execute_for(relation)
		relation.where @attribute => @value
	end
end
