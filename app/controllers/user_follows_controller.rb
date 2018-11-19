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
    @profile = Profile.find(params[:profile_id])
    @ufo = UserFollow.find(@id)
    if @ufo.status == true
      @ufo.status = false
    elsif @ufo.status == false
      @ufo.status = true
    end
    @ufo.update
    raise
    redirect_to profile_path(@profile)
  end

end
