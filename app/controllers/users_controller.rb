class UsersController < ApplicationController
	def show
		user = params[:id] == 'me' ? User.first : User.find(params[:id])
		render_object user
	end

	def update
		user = User.first
		user.update! params.permit(:email, :first_name, :last_name)
		if params[:image].present?
			user.image.purge
			user.image.attach(params[:image])
		end
		render_object user
	end
end