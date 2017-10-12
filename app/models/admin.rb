class Admin < ApplicationRecord
  has_many :admin_profiles
  has_many :profiles, through: :admin_profiles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
