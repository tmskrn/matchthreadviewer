class MatchthreadsController < ApplicationController
	def show
		@matchthread = Matchthread.find_by(thread_id: params[:thread_id])
		fullname = 't3_' + params[:thread_id].to_s
		@comments = Comment.where("thread_id = ? AND parent_id = ?", fullname, 0).order('score DESC')
	end
end
