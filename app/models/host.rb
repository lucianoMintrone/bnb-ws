# == Schema Information
#
# Table name: hosts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Host < ApplicationRecord
	validates :user, presence: true
	validates_uniqueness_of :user

	belongs_to :user

	has_many :rooms
end
