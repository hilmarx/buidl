require 'json'
require 'open-uri'

class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]


  def create
    # Find profile
    @profile = Profile.find(params[:profile_id])
    authorize (@profile)
    @user = User.find(@profile.user_id)
    # Set url of the repo
    url = params[:url]
    # users or orgs
    github_type = params[:github_type]
    # Create new project and contribution
    if @user.add_project(url, github_type)
      redirect_to profile_path(@profile)
    else
      redirect_to profile_path(@profile)
      flash[:alert] = "API problems, please try agin"
    end
  end

  # def index
  #   @projects = policy_scope(Product)
  # end

  def show

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
