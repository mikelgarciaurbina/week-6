class Api::PlayersController < ApplicationController

	before_action :tournament_exists, only: [:add]
	before_action :player_exists, only: [:add]

	def add
		player = @tournament.players.push(@player)
		render json: player
	end

	private
	def tournament_exists
		@tournament = Tournament.find(params[:tournament_id])
		unless @tournament
			render json: {error: "Tournament not found"}, status: 400
		end
	end

	def player_exists
		@player = Player.find(params[:id])
		unless @player
			render json: {error: "Player not found"}, status: 400
		end
	end
end
