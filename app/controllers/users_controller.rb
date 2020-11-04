class UsersController < ApplicationController
	def auth
		firebase_id = token[:firebase_id]
		email = token[:email]
		user = User.find_or_create_by(firebase_id: firebase_id) do |user|
			user.email = email
			user.save!
		end
		render_object user
	end

	def show
		render_object current_user
	end

	def update
		current_user.update! params.permit(:email, :first_name, :last_name)
		if params[:image].present?
			current_user.image.purge
			current_user.image.attach(params[:image])
		end
		render_object current_user
	end

	private
	def token
		hmac_secret = 'top-secret-phrase'
		JWT.decode(params[:token], hmac_secret, true, { algorithm: 'HS256' }).first.symbolize_keys!
	end
end