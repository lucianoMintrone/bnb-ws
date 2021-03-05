# == Schema Information
#
# Table name: bookings
#
#  id         :bigint           not null, primary key
#  from_date  :date
#  status     :string           default("pending"), not null
#  to_date    :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  guest_id   :bigint           not null
#  room_id    :bigint           not null
#
# Indexes
#
#  index_bookings_on_guest_id  (guest_id)
#  index_bookings_on_room_id   (room_id)
#
# Foreign Keys
#
#  fk_rails_...  (guest_id => guests.id)
#  fk_rails_...  (room_id => rooms.id)
#
require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
