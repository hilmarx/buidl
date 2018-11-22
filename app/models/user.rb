require 'json'
require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]
  has_one :profile

  after_create :link_github


  # Need an after create method that updates the data of the corresponding profile with the inputted values from the github OAuth

  # Method to add a project that is not in someones repos manually
  def add_project(url, github_type)
    inputted_url = url
    inputted_github_type = github_type
    AddProject.new(self.profile, inputted_url, inputted_github_type)
  end

  # Github Authentication Method
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.full_name = auth.info.name   # assuming the user model has a name
    user.profile_photo = auth.info.image  # assuming the user model has an image
    user.github_username = auth.info.nickname
    user.github_id = auth.uid

    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
    end
  end

  private

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

end
