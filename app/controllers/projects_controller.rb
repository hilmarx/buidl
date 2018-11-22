require 'json'
require 'open-uri'

class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  # def index
  #   @projects = policy_scope(Product)
  # end

  def show
    url = "https://api.github.com/repos/hilmarx/offthewagon"
    project_details_serialized = open(url).read
    project = Project.find(params[:id])  # make pundit happy
    authorize project
    @project_details = JSON.parse(project_details_serialized)
  end

  def update
    @profile = Profile.find(params[:profile_id])
    @project = Project.find(params[:id])

    authorize @project
    @project.update(project_params)
    redirect_to profile_path(@profile)
  end

  private

  def project_params
    params.require(:project).permit(:photo, :description, :name)
  end
end
