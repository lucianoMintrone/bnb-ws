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
require 'test_helper'

class WalletTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
