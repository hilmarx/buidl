require 'json'
require 'open-uri'

class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    url = "https://api.github.com/repos/hilmarx/offthewagon"
    project_details_serialized = open(url).read
    @project_details = JSON.parse(project_details_serialized)

  end

  def destroy
  end
end
