# == Schema Information
#
# Table name: guests
#
#  id                :bigint           not null, primary key
#  number_of_ratings :float            default(0.0)
#  total_rating      :float            default(0.0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_guests_on_user_id  (user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Guest < ApplicationRecord
	validates :user, presence: true
	validates_uniqueness_of :user

	belongs_to :user

	has_many :visited_rooms

	def average_rating
		return 0 unless number_of_ratings
		(total_rating / number_of_ratings).round 2
	end
end
