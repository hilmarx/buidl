class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search, :test]

  def home
    @profile = Profile.new
    # username = params[:first_name]
  end

  def search

  end

end
