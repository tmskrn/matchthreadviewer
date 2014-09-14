class MatchthreadsController < ApplicationController
	def show
		@matchthread = Matchthread.find(params[:id])
	end
end
