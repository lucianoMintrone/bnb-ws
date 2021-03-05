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
class Room < ApplicationRecord
	include Rails.application.routes.url_helpers
	include Blockable

	validates :host, :name, :room_type, presence: true
	belongs_to :host
	belongs_to :room_type

	has_many :bookings
	has_many :comments
	has_many :ratings, through: :bookings

	has_many_attached :images

	acts_as_mappable :default_units => :kms,
		:default_formula => :sphere,
		:distance_field_name => :distance,
		:lat_column_name => :latitude,
		:lng_column_name => :longitude

	def image_url
		return nil unless images.first
		url_for images.first
	end

	def average_rating
		return 0 unless number_of_ratings
		(total_rating / number_of_ratings).round 2
	end
end
