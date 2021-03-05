# == Schema Information
#
# Table name: favorite_bookings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  booking_id :bigint           not null
#  guest_id   :bigint           not null
#
# Indexes
#
#  index_favorite_bookings_on_booking_id  (booking_id)
#  index_favorite_bookings_on_guest_id    (guest_id)
#
# Foreign Keys
#
#  fk_rails_...  (booking_id => bookings.id)
#  fk_rails_...  (guest_id => guests.id)
#
class FavoriteBookingSerializer < ActiveModel::Serializer
	attributes :id

	belongs_to :booking
	belongs_to :guest
end
