require 'json'
require 'open-uri'

class Profile < ApplicationRecord
  belongs_to :user, optional: true

  has_many :leaders, class_name: "UserFollow", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, class_name: "UserFollow", foreign_key: "leader_id", dependent: :destroy


  has_many :profile_technologies, dependent: :destroy
  has_many :technologies, through: :profile_technologies
  has_many :project_follows, dependent: :destroy
  has_many :projects, through: :project_follows

  has_many :contributions, dependent: :destroy
  has_many :projects, through: :contributions

  before_save :fetch_github
  after_save :contribution_stats


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

  def create_contributions
    if self.contributions.present?
    else
      repos = self.projects
      repos.each do |repo|
        key = ENV['GITHUB_TOKEN']
        repo_contributions_serialized = open("https://api.github.com/repos/#{github_username}/#{repo.name}/stats/contributors?access_token=#{key}").read
        repo_contributions = JSON.parse(repo_contributions_serialized)
        repo_contributions.each do |contributions|
          lines_added = 0
          lines_deleted = 0
          commits = 0
          if contributions['author']['login'] == self.github_username
            contributions['weeks'].each do |contribution|
              if contribution['c'].nil?
              else
                lines_added += contribution['a'].to_i
                lines_deleted += contribution['d'].to_i
                commits += contribution['c'].to_i
              end
            end
          end
        new_contribution = Contribution.new(lines_added: lines_added, lines_deleted: lines_deleted, commits: commits, profile_id: self.id, project_id: Project.find_by(name: repo.name).id)
        new_contribution.save!
        self.contributions << new_contribution
        end
      end
    end

  end

  private

  def fetch_github
    key = ENV['GITHUB_TOKEN']
    github_username = self.github_username
    url = "https://api.github.com/users/#{github_username}?access_token=#{key}"
    github_profile_serialized = open(url).read
    github_profile = JSON.parse(github_profile_serialized)

    self.profile_photo = github_profile['avatar_url']
    self.github_url = github_profile['html_url']
    self.description = github_profile['bio']
    self.full_name = github_profile['name']

    github_repos_serialized = open("https://api.github.com/users/#{github_username}/repos?access_token=#{key}").read
    github_repos = JSON.parse(github_repos_serialized)

    github_repos.each do |repo|

      # Create Project Instance
      project = Project.new(
        name: repo['name'],
        private: repo['private'],
        description: repo['description'],
        primary_language: repo['language'],
        size_kilobytes: repo['size'],
        github_url: repo['html_url'],
        url: repo['homepage'],
        owner_id: repo['owner']['id'],
        github_id: repo['id'],
        )
      project.save!

      self.projects << project

      # Find all technologies of a project
      techs_serialized = open("https://api.github.com/repos/#{github_username}/#{project.name}/languages?access_token=#{key}").read
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

end
