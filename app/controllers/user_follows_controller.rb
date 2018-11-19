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
    @user_follow = UserFollow.find(params[:id])

    ufa = UserFollow.all
    ufa.each do |uf|
      # raise
      if uf.leader_id == params[:profile_id].to_i && uf.follower_id == current_user.id
        # raise
        if uf.status == true
          @id = uf.id
          break
        elsif uf.status == false
          uf.status = true
          @id = uf.id
          break
        end
      end
    end
    @ufo = UserFollow.find(@id)
    if @ufo.status == true
      @ufo.status = false
    elsif @ufo.status == false
      @ufo.status = true
    end
    @ufo.save
    # raise
    @profile = Profile.find(params[:profile_id])
    redirect_to profile_path(@profile)
  end

  # private

  # def user_follow_params
  #   params.require(:user_follow).permit(:leader_id, :follower_id, :status)
  # end

end
