class ContributionsController < ApplicationController

  def destroy
    @profile = Profile.find(params[:profile_id])
    @project = Project.find(params[:project_id])
    @contributions = @profile.contributions.where(project_id: @project.id)
    @contributions.destroy_all
    redirect_to profile_path(@profile)
  end

  private

end
