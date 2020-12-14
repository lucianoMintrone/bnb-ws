module Blockable
	extend ActiveSupport::Concern

	def block!
		update! blocked_at: DateTime.current
	end

	def is_blocked?
		blocked_at.present?
	end

	def unblock!
		update! blocked_at: nil
	end

	module ClassMethods
		def not_blocked
			where(blocked_at: nil)
		end
	end
end