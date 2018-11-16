class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :show]


  def create

    @profile = Profile.new(profile_params)

    @profile.save!


    redirect_to profile_path(@profile)

  end

  def show
    @project = Project.new
  @profile = Profile.find(params[:id])
    @profile.fetch_github
  end

  def profile_params
    params.require(:profile).permit(:github_username)
  end
end
