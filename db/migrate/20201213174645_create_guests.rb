class CreateGuests < ActiveRecord::Migration[5.2]
	def change
		create_table :guests do |t|
			t.references :user, foreign_key: true, index: { unique: true }, null: false
			t.timestamps
		end
	end
end
