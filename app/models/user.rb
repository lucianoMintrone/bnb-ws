class User < ApplicationRecord
	include Rails.application.routes.url_helpers

	has_one :host

	has_one_attached :image

	def image_url
		return nil unless image.attached?
		url_for image
	end
end
