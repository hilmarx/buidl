
class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    #--------- Octokit Test area -----------
    @client = Octokit::Client.new





    #---------- Test Area end -------------
  end

  def destroy
  end
end
