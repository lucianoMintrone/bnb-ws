# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  comment    :text
#  rate       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  booking_id :bigint           not null
#
# Indexes
#
#  index_ratings_on_booking_id  (booking_id)
#
# Foreign Keys
#
#  fk_rails_...  (booking_id => bookings.id)
#
class Rating < ApplicationRecord
	belongs_to :booking
end
