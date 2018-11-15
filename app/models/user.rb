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


  # Create a User Instance based on the Github Username
  def fetch_github
    github_username = "hilmarx"
    github_profile_serialized = open("https://api.github.com/users/#{github_username}").read
    github_profile = JSON.parse(github_profile_serialized)

    self.profile_photo = github_data['avatar_url']
    self.github_url = github_data['html_url']
    self.description = github_data['bio']
    self.first_name = github_data['name']

    github_repos_serialized = open("https://api.github.com/users/#{github_username}/repos").read
    github_repos = JSON.parse(github_repos_serialized)

    github_repos.each do |repo|
      project = Project.new(
        name: repo['name'],
        private: repo['private']




        )
    end


# Name
# Description
# Github resources
# Primary programming language
# All programming languages by byte size
# Whole project in byte size
# No. of commits
# No. of contributors
# How many lines were added, deleted and committed by individual contributors
# Commits over time (time series) for the past 12 months => Great to show recent activity


    #email
    #first_name
    #last_name
    #username

    #cover_photo
    #address
    #longitude
    #latitude
    #github_username
    #github_id


  end



end
