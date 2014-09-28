class CommentsController < ApplicationController
	def show
		fullname = 't3_' + params[:thread_id].to_s
		@comments = Comment.where("thread_id = ? AND parent_id = ?", fullname, 0)
	end
end