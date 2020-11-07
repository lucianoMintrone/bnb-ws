# == Schema Information
#
# Table name: rooms
#
#  id               :bigint           not null, primary key
#  host_id          :bigint           not null
#  room_type_id     :bigint           not null
#  name             :string           not null
#  description      :text
#  number_of_guests :integer
#  price_per_night  :float
#  longitude        :decimal(10, 6)
#  latitude         :decimal(10, 6)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Room < ApplicationRecord
	include Rails.application.routes.url_helpers

	validates :host, :name, :room_type, presence: true
	belongs_to :host
	belongs_to :room_type

	has_one_attached :image

	acts_as_mappable :default_units => :kms,
		:default_formula => :sphere,
		:distance_field_name => :distance,
		:lat_column_name => :latitude,
		:lng_column_name => :longitude

	def image_url
		return nil unless image.attached?
		url_for image
	end
end
