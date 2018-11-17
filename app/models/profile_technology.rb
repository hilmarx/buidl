class ProfileTechnology < ApplicationRecord
  belongs_to :user
  belongs_to :technology
end
