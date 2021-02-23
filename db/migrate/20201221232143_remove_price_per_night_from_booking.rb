class RemovePricePerNightFromBooking < ActiveRecord::Migration[5.2]
	def change
		remove_column :bookings, :price_per_night
	end
end
