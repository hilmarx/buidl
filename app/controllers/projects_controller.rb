class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
  end

  def destroy
  end
end
