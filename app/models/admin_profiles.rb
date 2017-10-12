class AdminProfiles < ApplicationRecord
  belongs_to :admin
  belongs_to :profile
end
