require 'json'
require 'open-uri'

class Profile < ApplicationRecord
  belongs_to :user, optional: true

  has_many :leaders, class_name: "UserFollow", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, class_name: "UserFollow", foreign_key: "leader_id", dependent: :destroy


  has_many :profile_technologies, dependent: :destroy
  has_many :technologies, through: :profile_technologies
  has_many :project_follows, dependent: :destroy
  has_many :followed_projects, through: :project_follows, source: "Project"

  has_many :contributions, dependent: :destroy
  has_many :projects, through: :contributions

  # before_save

  # BEFORE SAVE - feth github
  # Inside the service, if the response is good, save the profile and continue rest of service
  # else return an error
  after_create :fetch_github

  def top_languages
    # Calculations for finding the most used programming langugages in all repos owned by a profile
    hash = {}
    self.projects.each do |project|
      project.project_technologies.each do |project_tech|
        size = project_tech.size_bytes
        name = Technology.find(project_tech.technology_id).name
        if hash.has_key?(name)
          hash[name] += size
        else
          hash[name] = size
        end
      end
    end
    hash
  end


  def repo_number
    self.projects.length
  end



  # Create contribution for user passing in the project name

  private

  def fetch_github
    FetchGithub.new(self)
    self.save
  end


end
