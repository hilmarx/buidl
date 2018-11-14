class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followeds, class_name: "UserFollow", foreign_key: "followed_id"
  has_many :followers, class_name: "UserFollow", foreign_key: "follower_id"
end
