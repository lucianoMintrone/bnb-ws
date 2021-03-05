# == Schema Information
#
# Table name: room_types
#
#  id             :bigint           not null, primary key
#  displayed_name :string           not null
#  name           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class RoomTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
