class AddAvailabilityToRooms < ActiveRecord::Migration[5.2]
	def change
		add_column :rooms, :available_from, :date
		add_column :rooms, :available_to, :date
	end
end
