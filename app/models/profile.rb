require 'json'
require 'open-uri'

class Profile < ApplicationRecord
  belongs_to :user, optional: true

  has_many :leaders, class_name: "UserFollow", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, class_name: "UserFollow", foreign_key: "leader_id", dependent: :destroy


  has_many :user_technologies, dependent: :destroy
  has_many :technologies, through: :user_technologies
  has_many :project_follows, dependent: :destroy
  has_many :projects, through: :project_follows

  has_many :contributions, dependent: :destroy
  has_many :projects, through: :contributions

  before_save :fetch_github

  private

  def fetch_github

    github_username = self.github_username
    url = "https://api.github.com/users/#{github_username}?access_token=fdde57cbcdbcc6f8414dc20305c858f1f418b91f"
    github_profile_serialized = open(url).read
    github_profile = JSON.parse(github_profile_serialized)

    self.profile_photo = github_profile['avatar_url']
    self.github_url = github_profile['html_url']
    self.description = github_profile['bio']
    self.full_name = github_profile['name']

    github_repos_serialized = open("https://api.github.com/users/#{github_username}/repos?access_token=fdde57cbcdbcc6f8414dc20305c858f1f418b91f").read
    github_repos = JSON.parse(github_repos_serialized)

    github_repos.each do |repo|

      # Create Project Instance
      project = Project.new(
        name: repo['name'],
        private: repo['private'],
        description: repo['description'],
        primary_language: repo['language'],
        size_bytes: repo['size'],
        github_url: repo['html_url'],
        url: repo['homepage'],
        owner_id: repo['owner']['id'],
        github_id: repo['id'],
        )
      project.save!

      self.projects << project

      # Find all technologies of a project
      techs_serialized = open("https://api.github.com/repos/#{github_username}/#{project.name}/languages?access_token=fdde57cbcdbcc6f8414dc20305c858f1f418b91f").read
      techs = JSON.parse(techs_serialized)
      techs.each do |tech|
        lang = tech.first.downcase
        size_bytes = tech.last
        unless Technology.find_by(name: lang).nil?
          proj_tech = ProjectTechnology.new(project_id: project.id, technology_id: Technology.find_by(name: lang).id, size_bytes: size_bytes).save!
        end
      end

    end
  end

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

end
