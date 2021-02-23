# == Schema Information
#
# Table name: favorite_bookings
#
#  id         :bigint           not null, primary key
#  guest_id   :bigint           not null
#  booking_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class FavoriteBooking < ApplicationRecord
	validates :booking, :guest, presence: true

	belongs_to :booking
	belongs_to :guest
end
