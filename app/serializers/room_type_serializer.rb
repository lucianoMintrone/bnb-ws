# == Schema Information
#
# Table name: room_types
#
#  id             :bigint           not null, primary key
#  displayed_name :string           not null
#  name           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class RoomTypeSerializer < ActiveModel::Serializer
	attributes :id, :name, :displayed_name
end
