class AddHashIdToRoom < ActiveRecord::Migration[5.2]
	def change
		add_column :rooms, :hash_id, :string
	end
end
