class FilterByAttributeQuery < BaseQuery
	def initialize(attribute, value, comparison = '=')
		@attribute = attribute
		@value = value
		@comparison = comparison
	end

	def execute_for(relation)
		relation.where("#{@attribute} #{@comparison} ?", @value)
	end
end
