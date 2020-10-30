module ResponseRenderer
	def render_bookbnb_error(exception)
		render_error(
			name: exception.error,
			message: exception.error_message,
			status: exception.status_code
		)
	end

	def render_invalid_record_error(exception)
		render_error(
			name: :invalid_record,
			message: exception.record.errors.messages,
			status: :unprocessable_entity
		)
	end

	def render_record_not_found_error(exception)
		render_error(
			name: :record_not_found,
			message: "#{exception.model.constantize.model_name.human} not found",
			status: :not_found
		)
	end

	def render_error(name:, message:, status:)
		hash = { response: { error_name: name, error_message: message }.compact }
		render_response(hash: hash, status: status)
	end

	def render_response(parameters = {})
		render json: parameters[:hash], adapter: :json, status: parameters[:status]
	end

	def render_successful_response(hash)
		render_response hash: hash, status: :ok
	end

	def render_object(object, options = {})
		render_successful_response ObjectRenderer.new(object, options).render
	end

	def render_collection(collection, options = {})
		render_successful_response CollectionRenderer.new(collection, options).render
	end
end
