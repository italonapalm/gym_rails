class Profile < ApplicationRecord
  before_create :set_profile

  has_many :profile_roles
  has_many :roles, through: :profile_roles

  # Constants
  PER_PAGE_ITEMS = 6

  # Scopes
  scope :ascending_name_order, -> (page) {
    where(active: true).order(name: :asc).page(page).per(PER_PAGE_ITEMS)
  }

  scope :actives, -> {
    where(active: true).order(name: :asc)
  }

  scope :search, -> (query) {
    where("name LIKE ? AND active = true", "#{query.to_s}").order(name: :asc).page(1).per(PER_PAGE_ITEMS)
  }

  def deactivate
    update(active: false)
  end

  def set_profile
    self.active = true
  end
end
