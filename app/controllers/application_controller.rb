class ApplicationController < ActionController::Base
	include ResponseRenderer

	rescue_from ::BookbnbError, with: :render_paper_chef_error
	rescue_from ::ActiveRecord::RecordInvalid, with: :render_invalid_record_error
	rescue_from ::ActiveRecord::RecordNotFound, with: :render_record_not_found_error
end
