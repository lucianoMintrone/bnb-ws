# == Schema Information
#
# Table name: ratings
#
#  id            :bigint           not null, primary key
#  comment       :text
#  rate          :integer
#  rateable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rateable_id   :bigint           not null
#
# Indexes
#
#  index_ratings_on_rateable_type_and_rateable_id  (rateable_type,rateable_id)
#
class RatingSerializer < ActiveModel::Serializer
	attributes :id, :rate, :comment

	belongs_to :rateable
end
