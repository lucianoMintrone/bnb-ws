# == Schema Information
#
# Table name: rooms
#
#  id                :bigint           not null, primary key
#  available_from    :date
#  available_to      :date
#  blocked_at        :datetime
#  description       :text
#  latitude          :decimal(10, 6)
#  longitude         :decimal(10, 6)
#  name              :string           not null
#  number_of_guests  :integer
#  number_of_ratings :float            default(0.0)
#  price_per_night   :float
#  total_rating      :float            default(0.0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  hash_id           :string
#  host_id           :bigint           not null
#  room_type_id      :bigint           not null
#
# Indexes
#
#  index_rooms_on_host_id       (host_id)
#  index_rooms_on_room_type_id  (room_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (host_id => hosts.id)
#  fk_rails_...  (room_type_id => room_types.id)
#
class RoomSerializer < ActiveModel::Serializer
	include Rails.application.routes.url_helpers

	attributes :id, :name, :description, :number_of_guests, :price_per_night, :longitude, :latitude,
		:available_from, :available_to, :average_rating

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
