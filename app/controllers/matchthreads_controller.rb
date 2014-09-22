class MatchthreadsController < ApplicationController
	def show
		@matchthread = Matchthread.find_by(thread_id: params[:thread_id])
	end
end
