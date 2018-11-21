class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]



  def new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.create(username: params[:username], email: "#{params[:username]}@gmail.com", password: 'password')
    redirect_to root_path
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
