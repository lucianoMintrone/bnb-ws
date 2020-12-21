class BookingSerializer < ActiveModel::Serializer
	attributes :id, :from_date, :to_date, :status

	has_one :guest
	has_one :room
end