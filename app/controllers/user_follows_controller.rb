class UserFollowsController < ApplicationController
  def create
    @user_follow = UserFollow.new
    @user_follow.follower = current_user
    @profile = Profile.find(params[:profile_id])
    @user = @profile.user
    @user_follow.leader = @user
    @user_follow.save
    redirect_to profile_path(@profile)
  end

  def update
    @profile = Profile.find(params[:profile_id])
    @user_follow = UserFollow.find(params[:id])
    @user_follow.update(status: !@user_follow.status)
    redirect_to profile_path(@profile)
  end

  # private

  # def user_follow_params
  #   params.require(:user_follow).permit(:leader, :follower, :status)
  # end

end
