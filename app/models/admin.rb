class Admin < ApplicationRecord
  has_many :admin_profiles
  has_many :profiles, through: :admin_profiles

  PER_PAGE_ITEMS = 6

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Scopes
  scope :actives, -> (page) {
    where(active: true).page(page).per(PER_PAGE_ITEMS)
  }
end
