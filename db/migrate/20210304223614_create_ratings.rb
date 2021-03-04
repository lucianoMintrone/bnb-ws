class CreateRatings < ActiveRecord::Migration[5.2]
	def change
		create_table :ratings do |t|
			t.belongs_to :booking, foreign_key: true, null: false, on_delete: :cascade
			t.integer :rate
			t.text :comment
			t.timestamps
		end

		add_column :rooms, :total_rating, :float, default: 0
		add_column :rooms, :number_of_ratings, :float, default: 0
	end
end
