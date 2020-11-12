class GetModels
	def initialize(repository:, filter_by:)
		fail "Invalid repository" unless repository.present?
		@repository = repository
		@filter_by = filter_by
	end

	def execute
		get_models
	end

	private
	def get_models
		@repository.list filter_by: @filter_by
	end
end
