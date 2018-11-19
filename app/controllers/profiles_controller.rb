class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :show]


  def create
    if Profile.find_by(github_username: profile_params[:github_username]).present?
      @profile = Profile.find_by(github_username: profile_params[:github_username])
      if current_user != nil
        @profile.user = current_user
      end
      redirect_to profile_path(@profile)
    else
      @profile = Profile.new(profile_params)
      if current_user != nil
        @profile.user = current_user
      end
      @profile.save!
      redirect_to profile_path(@profile)
    end

  end

  def show
    @profile = Profile.find(params[:id])
    if current_user != nil
      @profile.user = current_user
    end
  end

  def profile_params
    params.require(:profile).permit(:github_username)
  end
end
