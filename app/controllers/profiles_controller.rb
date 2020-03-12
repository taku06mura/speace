class ProfilesController < ApplicationController

  def new
    @profiles = Profile.new
  end
end
