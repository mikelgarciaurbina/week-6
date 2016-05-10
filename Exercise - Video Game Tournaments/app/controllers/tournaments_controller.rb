class TournamentsController < ApplicationController
	def index
		@players = Player.all
	end

	def show
		@tournament = Tournament.find(params[:id])
	end
end
