class ContributionsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:destroy]

  def destroy
    @profile = Profile.find(params[:profile_id])
    @project = Project.find(params[:project_id])
    @contributions = @profile.contributions.where(project_id: @project.id)

    authorize @contributions

    @contributions.destroy_all
    redirect_to profile_path(@profile)
  end

end
