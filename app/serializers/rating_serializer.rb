class RatingSerializer < ActiveModel::Serializer
	attributes :id, :rate, :comment

	belongs_to :booking
end