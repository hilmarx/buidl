class Project < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :project_follows
  has_many :users, through: :project_follows

  has_many :project_technologies
  has_many :technologies, through: :project_technologies

  has_many :contributions
  has_many :profiles, through: :contributions


  def kebab_convert(project_title)

    new_title = []

    title = project_title
    split_title = title.split('-')

    split_title.each do |w|
      new_title << w.capitalize
      new_title << " "
    end
    new_title.join.strip
  end
end
