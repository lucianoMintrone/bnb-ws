class CreateWallets < ActiveRecord::Migration[5.2]
	def change
		create_table :wallets do |t|
			t.belongs_to :user, foreign_key: true, null: false, on_delete: :cascade
			t.integer :external_id
			t.string :address
			t.text :mnemonic
			t.timestamps
		end
	end
end
