class FavoriteBooking < ApplicationRecord
	validates :booking, :guest, presence: true

	belongs_to :booking
	belongs_to :guest
end
