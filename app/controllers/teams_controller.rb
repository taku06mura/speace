class TeamsController < ApplicationController

  def new
    @team = Team.new
    @team.users << current_user
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to root_path, notice: 'チームを作成しました'
    else
      render :new
    end
  end

  private
  def team_prarams
    params.require(team).permit(:mame, user_ids: [])
  end

end
