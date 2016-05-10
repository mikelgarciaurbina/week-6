class Api::TournamentsController < ApplicationController

	before_action :tournament_exists, only: [:destroy]

	def index
		tournaments = Tournament.all
		render json: tournaments
	end

	def create
		tournament = Tournament.create(tournament_params)
		render json: tournament, status: 201 
	end

	def destroy
		@tournament.destroy
		render json: @tournament
	end

	private
	def tournament_params
		params.require(:tournament).permit(:name)
	end

	def tournament_exists
		@tournament = Tournament.find(params[:id])
		unless @tournament
			render json: {error: "Tournament not found"}, status: 400
		end
	end
end
