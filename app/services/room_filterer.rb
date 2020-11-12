class RoomFilterer
	def initialize(filter_params, relation)
		@filter_params = filter_params
		@relation = relation
		validate
	end

	def execute
		filtering_queries.inject(@relation) { |relation, query| query.execute_for relation }
	end

	private
	def validate
		fail "Invalid filter params" if @filter_params.nil?
		fail "Invalid relation" if @relation.nil?
	end

	def filtering_queries
		@filtering_queries ||= @filter_params.map do |filter_option, filter_value|
			filtering_query_for filter_option, filter_value
		end
	end

	def filtering_query_for(filter_option, filter_value)
		filter_option.to_s.camelize.constantize.new(filter_value)
	rescue NameError
		raise BookbnbError.new 'invalid_filter', 'Invalid filter'
	end

	# def filtering_query_for(filter_option, filter_value)
	# 	case filter_option
	# 	when :room_type_id
	# 		FilterByAttributeQuery.new :id, filter_value
	# 	# when :status
	# 	# 	FilterByOperationStatusQuery.new filter_value
	# 	# when :created_at
	# 	# 	FilterByDateRangeQuery.new :operations, :created_at, filter_value
	# 	# when :loanee_cuit
	# 	# 	FilterByLoaneeCuitQuery.new filter_value
	# 	# when :loanee_name
	# 	# 	FilterByLoaneeNameQuery.new filter_value
	# 	else
	# 		invalid_filter_option! filter_option
	# 	end
	# end

	def invalid_filter_option!(filter_option)
		raise BookbnbError.new 'invalid_filter_by', "Invalid filter option: #{filter_option}"
	end
end
