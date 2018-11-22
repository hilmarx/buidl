require 'json'
require 'open-uri'

class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    url = "https://api.github.com/repos/hilmarx/offthewagon"
    project_details_serialized = open(url).read
    @project_details = JSON.parse(project_details_serialized)
  end

  def update
    @profile = Profile.find(params[:profile_id])
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to profile_path(@profile)
  end

  private

  def project_params
    params.require(:project).permit(:photo, :description, :name)
  end
end
