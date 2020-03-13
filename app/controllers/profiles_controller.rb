class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.create(profile_params)
    
  end

  private

  def profile_params
    params.require(:profile).permit(:nickname, :introduction, :image).merge(user_id: current_user.id)
  end
end
