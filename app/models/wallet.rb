# == Schema Information
#
# Table name: wallets
#
#  id          :bigint           not null, primary key
#  address     :string
#  mnemonic    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  external_id :integer
#  user_id     :bigint           not null
#
# Indexes
#
#  index_wallets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Wallet < ApplicationRecord
	validates :user, presence: true

	belongs_to :user
end
