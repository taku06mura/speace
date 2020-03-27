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

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to root_path, notice: 'チームを更新しました'
    else
      render :edit
    end
  end

  private
  def team_params
    params.require(:team).permit(:name, user_ids: [])
  end

end
