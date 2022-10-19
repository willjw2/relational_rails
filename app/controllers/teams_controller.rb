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
    team = Team.create(name: params[:name], wins: params[:wins], losses: params[:losses], active: params[:active])
    redirect_to "/teams"
  end
end
