class CreateFavoriteBookings < ActiveRecord::Migration[5.2]
	def change
		create_table :favorite_bookings do |t|
			t.belongs_to :guest, foreign_key: true, null: false, on_delete: :cascade
			t.belongs_to :booking, foreign_key: true, null: false, on_delete: :cascade
			t.timestamps
		end
	end
end
