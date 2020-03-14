class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.create(profile_params)
    redirect_to root_path
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:nickname, :introduction, :image).merge(user_id: current_user.id)
  end
end
