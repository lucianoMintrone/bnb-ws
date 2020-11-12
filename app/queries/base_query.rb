class BaseQuery
	def execute_for(relation)
		fail "Subclass responsibility"
	end
end
