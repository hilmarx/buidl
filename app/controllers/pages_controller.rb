class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search, :test]

  def home
    @user = User.new
    # username = params[:first_name]
  end

  def search
  end

  def test
    if User.find_by(username: "hilmarx").nil?
      @user = User.create(username: "hilmarx", email: "h@h.h", password: "hhhhhh")
      @user.fetch_github
    else
      @user = User.find_by(username: "hilmarx")
    end

  end
end
