require 'rest-client'

class UsersController < ApiController
	skip_before_action :authorize_user, :validate_user, only: [:auth]

	def auth
		firebase_user = FirebaseUser.new(token: params[:token])
		find_user = User.find_or_create_by(firebase_id: firebase_user.id) do |user|
			user.email = firebase_user.email
			user.save!
			Host.create! user: user
			Guest.create! user: user
			create_wallet_for_user user
		end
		check_if_user_is_blocked find_user
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

	private
	def create_wallet_for_user(user)
		response = RestClient.post('https://calm-oasis-56692.herokuapp.com/identity', {}.to_json, {content_type: :json, accept: :json})
		wallet = JSON.parse response
		Wallet.create! user: user, external_id: wallet["id"], address: wallet["address"], mnemonic: wallet["mnemonic"]
	end
end