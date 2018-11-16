class Contribution < ApplicationRecord
  belongs_to :profile
  belongs_to :project
end
