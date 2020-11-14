class Available
	def initialize(value)
		@value = value
	end

	def execute_for(relation)
		relation = FilterByAttributeQuery.new(:available_from, from, '<=').execute_for(relation) if from.present?
		relation = FilterByAttributeQuery.new(:available_to, to, '>=').execute_for(relation) if to.present?
		relation
	end

	private
	def from
		@value[:from]
	end

	def to
		@value[:to]
	end
end