class TeamsController < ApplicationController
  def index
    @teams = Team.sort_by_recently_created
  end
  def show
    @team = Team.find(params[:id])
  end
end
