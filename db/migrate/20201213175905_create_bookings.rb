class CreateBookings < ActiveRecord::Migration[5.2]
	def change
		create_table :bookings do |t|
			t.belongs_to :room, foreign_key: true, null: false, on_delete: :cascade
			t.belongs_to :guest, foreign_key: true, null: false, on_delete: :cascade
			t.date :from_date
			t.date :to_date
			t.float :price_per_night
			t.string :status, null: false, default: 'pending'
			t.timestamps
		end
	end
end
