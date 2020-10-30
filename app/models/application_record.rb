class ApplicationRecord < ActiveRecord::Base
	include Serializable

	self.abstract_class = true
end
