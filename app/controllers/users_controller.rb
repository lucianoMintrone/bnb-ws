class UsersController < ApplicationController
	skip_before_action :authorize_user, only: [:auth]

	def auth
		firebase_user = FirebaseUser.new(token: params[:token])
		find_user = User.find_or_create_by(firebase_id: firebase_user.id) do |user|
			user.email = firebase_user.email
			user.save!
			Host.create! user: user
		end
		render_object find_user
	end

	def show
		render_object user
	end

	def update
		user.update! params.permit(:email, :first_name, :last_name)
		if params[:image].present?
			user.image.purge
			user.image.attach(params[:image])
		end
		render_object user
	end
end