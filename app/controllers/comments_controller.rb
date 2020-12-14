class CommentsController < ApiController
	def create
		comment = Comment.create! user: user, room_id: params[:room_id], text: params[:text]
		render_object comment
	end
end