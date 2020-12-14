class RoomSerializer < ActiveModel::Serializer
	include Rails.application.routes.url_helpers

	attributes :id, :name, :description, :number_of_guests, :price_per_night, :longitude, :latitude,
		:available_from, :available_to

	belongs_to :host
	belongs_to :room_type

	has_many :comments
	has_many :images

	has_one :image_url

	def images
		object.images.map { |image| url_for image }
	end

	def longitude
		object.longitude.to_f
	end

	def latitude
		object.latitude.to_f
	end
end