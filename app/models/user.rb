require 'json'
require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile

  after_create :link_github


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
