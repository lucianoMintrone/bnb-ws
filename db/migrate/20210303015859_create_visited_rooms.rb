class CreateVisitedRooms < ActiveRecord::Migration[5.2]
	def change
		create_table :visited_rooms do |t|
			t.belongs_to :guest, foreign_key: true, null: false, on_delete: :cascade
			t.belongs_to :room, foreign_key: true, null: false, on_delete: :cascade
			t.boolean :push_notification_has_been_sent, default: false, null: false
			t.timestamps
		end
	end
end
