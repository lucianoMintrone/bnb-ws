class AddFirebaseIdToUsers < ActiveRecord::Migration[5.2]
	def change
		add_column :users, :firebase_id, :string, index: { unique: true }, null: false, default: ''
		add_index :users, :firebase_id, unique: true
	end
end
