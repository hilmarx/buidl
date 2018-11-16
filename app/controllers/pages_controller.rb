class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search, :test]

  def home
    @user = User.new
    @profile = Profile.new
    redirect_to pages_test_path
    # username = params[:first_name]
  end

  def search
  end

  def test
    # first you need to get the input from the homepage form --> which is username
    # username =
    # create a user instance with that username, a random email and a random passord
    # mail = input@gmail.com
    @user = User.create(username: "ctrlxie", email: "wnoleson@gmail.com", password: "hhhhhhf")
    @user.fetch_github
  end
end
