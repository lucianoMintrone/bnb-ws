class Host < ApplicationRecord
	validates :user, presence: true
	validates_uniqueness_of :user

	belongs_to :user
end
