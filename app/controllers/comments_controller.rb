class CommentsController < ApplicationController
	def show
		fullname = 't3_' + params[:thread_id].to_s
		Comment.get_comments(fullname)

		@comments = Comment.where("thread_id = ?", fullname)
		render @comments
	end
end