# == Schema Information
#
# Table name: bookings
#
#  id         :bigint           not null, primary key
#  room_id    :bigint           not null
#  guest_id   :bigint           not null
#  from_date  :date
#  to_date    :date
#  status     :string           default("pending"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Booking < ApplicationRecord
	validates :guest, :room, :status, presence: true

	belongs_to :guest
	belongs_to :room

	enum status: { pending: 'pending', accepted: 'accepted', rejected: 'rejected' }
end
