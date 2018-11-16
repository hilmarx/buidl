require 'json'
require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :leaders, class_name: "UserFollow", foreign_key: "follower_id"
  has_many :followers, class_name: "UserFollow", foreign_key: "leader_id"

  has_many :user_technologies
  has_many :technologies, through: :user_technologies

  has_many :project_follows
  has_many :projects, through: :project_follows

  has_many :contributions
  has_many :projects, through: :contributions

  before_save :fetch_github


  # Create a User Instance based on the Github Username
  def fetch_github
    github_username = self.username
    url = "https://api.github.com/users/ctrlxie?access_token=62d50e2cbc06a841f952d8fc70b7bd2b2c7917de"
    github_profile_serialized = open(url).read
    github_profile = JSON.parse(github_profile_serialized)

    self.profile_photo = github_profile['avatar_url']
    self.github_url = github_profile['html_url']
    self.description = github_profile['bio']
    self.full_name = github_profile['name']

    github_repos_serialized = open("https://api.github.com/users/#{github_username}/repos").read
    github_repos = JSON.parse(github_repos_serialized)

    github_repos.each do |repo|
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
        url: repo['html_url']
        )
      project.save!

      self.projects << project

    # t.string "url"
    # t.string "photo"
    # t.integer "owner_id"

    # t.integer "lines_added"
    # t.integer "lines_deleted"
    # t.integer "commits"
    # t.boolean "archived"
    # t.string "full_name"

    end
  end

end
