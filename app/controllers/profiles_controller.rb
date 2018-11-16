class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create

  end

  def show
    @profile = Profile.create(:github_username)
    @profile.fetch_github
  end

  def profile_params
    params.require(:profile).permit(:github_username)
  end
end
