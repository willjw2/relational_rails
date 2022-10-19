class TeamPlayersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
  end

  def new
    @team = Team.find(params[:team_id])
  end

  def create
    team = Team.find(params[:team_id])
    player = team.players.create(team_player_params)
    redirect_to "/teams/#{params[:team_id]}/players"
  end

private
  def team_player_params
    params.permit(:name, :age, :retired)
  end
end
