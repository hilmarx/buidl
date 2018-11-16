class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search, :test]

  def home
    @user = User.new
    @profile = Profile.new
    # username = params[:first_name]
  end

  def search
  end

  def test
      @user = User.create(username: "ctrlxie")
      @user.fetch_github
  end
end
