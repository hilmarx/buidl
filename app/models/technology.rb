class Technology < ApplicationRecord
  has_many :user_technologies
  has_many :profiles, through: :user_technologies

  has_many :project_technologies
  has_many :projects, through: :project_technologies
end
