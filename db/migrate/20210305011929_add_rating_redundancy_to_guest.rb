class AddRatingRedundancyToGuest < ActiveRecord::Migration[5.2]
	def change
		add_column :guests, :total_rating, :float, default: 0
		add_column :guests, :number_of_ratings, :float, default: 0
	end
end
