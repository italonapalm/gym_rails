class ProfileRole < ApplicationRecord
  belongs_to :profile
  belongs_to :role
end
