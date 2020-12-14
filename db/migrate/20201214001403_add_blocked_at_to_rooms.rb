class AddBlockedAtToRooms < ActiveRecord::Migration[5.2]
	def change
		add_column :rooms, :blocked_at, :datetime
	end
end
