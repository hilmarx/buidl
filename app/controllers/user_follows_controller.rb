class UserFollowsController < ApplicationController
  def new
  end

  def create
    @user_follow = UserFollow.new
    @user_follow.follower = current_user
    @profile = Profile.find(params[:profile_id])
    @user = @profile.user
    @user_follow.leader = @user
    @user_follow.save
    redirect_to profile_path(@profile)
  end

  def destroy
  end
end
