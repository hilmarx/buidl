class Project < ApplicationRecord
  has_many :project_follows
  has_many :users, through: :project_follows

  has_many :project_technologies
  has_many :technologies, through: :project_technologies

  has_many :contributions
  has_many :users, through: :contributions
end
