class CreateComments < ActiveRecord::Migration[5.2]
	def change
		create_table :comments do |t|
			t.belongs_to :room, foreign_key: true, null: false, on_delete: :cascade
			t.belongs_to :user, foreign_key: true, null: false, on_delete: :cascade
			t.text :text
			t.timestamps
		end
	end
end
