class Profile < ApplicationRecord
  has_many :profile_roles
  has_many :roles, through: :profile_roles
end
