class TeamsController < ApplicationController
  def index
    @teams = Team.sort_by_recently_created
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def create
    # team = Team.create(name: params[:name], wins: params[:wins], losses: params[:losses], active: params[:active])
    team = Team.create(team_params)
    redirect_to "/teams"
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    redirect_to "/teams"
  end

  def destroy
    team = Team.find(params[:id])
    #do this in model (deleting references)
    # team.players.each {|player| player.destroy}
    team.destroy
    redirect_to "/teams"
  end

private
  def team_params
    params.permit(:name, :wins, :losses, :active)
  end
end
