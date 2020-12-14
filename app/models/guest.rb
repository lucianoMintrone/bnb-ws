# == Schema Information
#
# Table name: guests
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Guest < ApplicationRecord
	validates :user, presence: true
	validates_uniqueness_of :user

	belongs_to :user
end
