class UserTechnology < ApplicationRecord
  belongs_to :profile
  belongs_to :technology
end
