class RoomSerializer < ActiveModel::Serializer
	attributes :id, :name, :description, :number_of_guests, :price_per_night, :longitude, :latitude

	belongs_to :host
	belongs_to :room_type
	has_one :image_url

	def longitude
		object.longitude.to_f
	end

	def latitude
		object.latitude.to_f
	end
end