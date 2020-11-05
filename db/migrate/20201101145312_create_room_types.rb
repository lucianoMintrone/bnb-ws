class CreateRoomTypes < ActiveRecord::Migration[5.2]
	def change
		create_table :room_types do |t|
			t.string :name, null: false, unique: true
			t.string :displayed_name, null: false
			t.timestamps
		end
	end
end
