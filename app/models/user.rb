require 'json'
require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile

  after_create :link_github

  def link_github
    profile = Profile.find_by(github_username: self.github_username)
    if profile
      profile.user = self
    else
      profile = Profile.new(github_username: self.github_username)
      profile.user = self
    end
    profile.save
  end


  # Create a User Instance based on the Github Username
  # def fetch_github
  #   github_username = self.username
  #   url = "https://api.github.com/users/ctrlxie?access_token=62d50e2cbc06a841f952d8fc70b7bd2b2c7917de"
  #   github_profile_serialized = open(url).read
  #   github_profile = JSON.parse(github_profile_serialized)

  #   self.profile_photo = github_profile['avatar_url']
  #   self.github_url = github_profile['html_url']
  #   self.description = github_profile['bio']
  #   self.full_name = github_profile['name']

  #   github_repos_serialized = open("https://api.github.com/users/#{github_username}/repos?access_token=62d50e2cbc06a841f952d8fc70b7bd2b2c7917de").read
  #   github_repos = JSON.parse(github_repos_serialized)

  #   github_repos.each do |repo|

  #     # Create Project Instance
  #     project = Project.new(
  #       name: repo['name'],
  #       private: repo['private'],
  #       description: repo['description'],
  #       primary_language: repo['language'],
  #       size_bytes: repo['size'],
  #       github_url: repo['html_url'],
  #       url: repo['homepage'],
  #       owner_id: repo['owner']['id'],
  #       github_id: repo['id'],
  #       )
  #     project.save!
  #     self.projects << project

  #     # Find all technologies of a project
  #     techs_serialized = open("https://api.github.com/repos/#{github_username}/#{project.name}/languages?access_token=62d50e2cbc06a841f952d8fc70b7bd2b2c7917de").read
  #     techs = JSON.parse(techs_serialized)
  #     techs.each do |tech|
  #       lang = tech.first.downcase
  #       size_bytes = tech.last
  #       unless Technology.find_by(name: lang).nil?
  #         ProjectTechnology.new(project_id: project.id, technology_id: Technology.find_by(name: lang).id, size_bytes: size_bytes).save!
  #       end
  #     end




  #   # t.string "url"
  #   # t.string "photo"
  #   # t.integer "owner_id"

  #   # t.integer "lines_added"
  #   # t.integer "lines_deleted"
  #   # t.integer "commits"
  #   # t.boolean "archived"
  #   # t.string "full_name"

  #   end
  # end

end
