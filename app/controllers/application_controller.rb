class ApplicationController < ActionController::Base
	include ResponseRenderer

	skip_before_action :verify_authenticity_token

	rescue_from ::BookbnbError, with: :render_paper_chef_error
	rescue_from ::ActiveRecord::RecordInvalid, with: :render_invalid_record_error
	rescue_from ::ActiveRecord::RecordNotFound, with: :render_record_not_found_error

	private
	def current_user
		return unless user_id
		@current_user ||= user_id == 'me' ? User.first : User.find(user_id)
	end

	def current_host
		@current_host ||= host_id == 'me' ? Host.first : Host.find(host_id)
	end

	def host_id
		params[:id] || params[:host_id]
	end

	def user_id
		params[:id]
	end
end
