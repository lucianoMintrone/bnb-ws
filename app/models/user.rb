# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
	include Rails.application.routes.url_helpers

	has_one :host

	has_one_attached :image

	def image_url
		return nil unless image.attached?
		url_for image
	end
end
