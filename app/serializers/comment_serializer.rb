class CommentSerializer < ActiveModel::Serializer
	attributes :id, :text

	belongs_to :room
	belongs_to :user
end