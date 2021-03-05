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
class GuestSerializer < ActiveModel::Serializer
	attributes :id, :average_rating

	belongs_to :user
end
