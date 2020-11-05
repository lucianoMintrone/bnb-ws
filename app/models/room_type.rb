# == Schema Information
#
# Table name: room_types
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  displayed_name :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class RoomType < ApplicationRecord
	validates :name, :displayed_name, presence: true
	validates_uniqueness_of :name

	enum name: { entire_place: 'entire_place', private_room: 'private_room', shared_room: 'shared_room' }
end
