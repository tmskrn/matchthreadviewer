class MatchthreadsController < ApplicationController
	def show
		puts "This is the " + params[:thread_id] + " thread id."
		@matchthread = Matchthread.find_by(thread_id: params[:thread_id])
	end
end
