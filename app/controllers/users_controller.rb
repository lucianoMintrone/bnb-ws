class UsersController < ApplicationController
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
end