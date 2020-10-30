class UsersController < ApplicationController
	def show
		user = params[:id] == 'me' ? User.first : User.find(params[:id])
		render_object user
	end
end