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
end
