# == Schema Information
#
# Table name: wallets
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  external_id :integer
#  address     :string
#  mnemonic    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Wallet < ApplicationRecord
	validates :user, presence: true

	belongs_to :user
end
