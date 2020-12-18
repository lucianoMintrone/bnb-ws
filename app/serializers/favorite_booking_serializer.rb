class FavoriteBookingSerializer < ActiveModel::Serializer
	attributes :id

	belongs_to :booking
	belongs_to :guest
end