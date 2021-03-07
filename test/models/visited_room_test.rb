# == Schema Information
#
# Table name: visited_rooms
#
#  id                              :bigint           not null, primary key
#  push_notification_has_been_sent :boolean          default(FALSE), not null
#  similar_room_push_has_been_sent :boolean          default(FALSE), not null
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  guest_id                        :bigint           not null
#  room_id                         :bigint           not null
#
# Indexes
#
#  index_visited_rooms_on_guest_id  (guest_id)
#  index_visited_rooms_on_room_id   (room_id)
#
# Foreign Keys
#
#  fk_rails_...  (guest_id => guests.id)
#  fk_rails_...  (room_id => rooms.id)
#
require 'test_helper'

class VisitedRoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
