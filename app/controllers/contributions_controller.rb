class ContributionsController < ApplicationController

  def destroy
    @contributions = Contribution.where(project_id: contributions_params)
    @contributions.destroy
  end

  private

  def contributions_params
    params.require(:contribution).permit(:project_id)
  end
end
