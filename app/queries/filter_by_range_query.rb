class FilterByRangeQuery < BaseQuery
	def initialize(attribute, value)
		@attribute = attribute
		@value = value
	end

	def execute_for(relation)
		return relation.where @attribute => (from..to)
	end

	private
	def from
		@value[:from] || "0"
	end

	def to
		@value[:to] || Float::MAX.to_s
	end
end
