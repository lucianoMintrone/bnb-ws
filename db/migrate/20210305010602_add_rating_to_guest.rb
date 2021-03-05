class AddRatingToGuest < ActiveRecord::Migration[5.2]
	def change
		remove_column :ratings, :booking_id, :integer
		change_table :ratings do |t|
			t.belongs_to :rateable, polymorphic: true, null: false, on_delete: :cascade
		end
	end
end
