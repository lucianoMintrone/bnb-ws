class BookingSerializer < ActiveModel::Serializer
	attributes :id, :from_date, :to_date, :price_per_night, :status

	has_one :guest
	has_one :room
end