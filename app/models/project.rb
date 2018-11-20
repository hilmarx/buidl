class Project < ApplicationRecord
<<<<<<< HEAD
  mount_uploader :photo, PhotoUploader

=======
  validates :id, uniqueness: true
>>>>>>> 0ef3832e1019691fa8dbfbb212dd94f3d9db0c42
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
