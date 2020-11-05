class CreateRooms < ActiveRecord::Migration[5.2]
	def change
		create_table :rooms do |t|
			t.belongs_to :host, foreign_key: true, null: false, on_delete: :cascade
			t.belongs_to :room_type, foreign_key: true, null: false
			t.string :name, null: false
			t.text :description
			t.integer :number_of_guests
			t.float :price_per_night
			t.decimal :longitude, precision: 10, scale: 6
			t.decimal :latitude, precision: 10, scale: 6
			t.timestamps
		end
	end
end
