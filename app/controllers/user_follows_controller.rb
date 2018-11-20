class UserFollowsController < ApplicationController
  def create
    @user_follow = UserFollow.new
    @user_follow.follower = current_user
    @profile = Profile.find(params[:profile_id])
    @user = @profile.user
    @user_follow.leader = @user
    @user_follow.save
    #binding.pry
    redirect_to profile_path(@profile)
  end

  def update
    @profile = Profile.find(params[:profile_id])
    # raise
    @user_follow = UserFollow.find(params[:id])

    @user_follow.update(status: !@user_follow.status)
    # raise
    # @user_follow.update(user_follow_params)
    redirect_to profile_path(@profile)



    # @ufo = UserFollow.find(@id)
    # if @ufo.status == true
    #   @ufo.status = false
    # elsif @ufo.status == false
    #   @ufo.status = true
    # end
    # THIS SHOULD BE UPDATE (not save) BUT I COULDN'T GET IT TO WORK:
    # @ufo.save
    # @profile = Profile.find(params[:profile_id])

  end

  private

  def user_follow_params
    params.require(:user_follow).permit(:leader, :follower, :status)
  end

end
