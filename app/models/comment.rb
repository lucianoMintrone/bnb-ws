# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  room_id    :bigint           not null
#  user_id    :bigint           not null
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
	validates :user, :room, presence: true

	belongs_to :room
	belongs_to :user
end
