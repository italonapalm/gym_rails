class Role < ApplicationRecord
  before_create :set_role
  before_update :set_update_role

  has_many :profile_roles
  has_many :profiles, through: :profile_roles

  # Constants
  PER_PAGE_ITEMS = 6

  # Validates
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates_uniqueness_of :name

  # Scopes
  scope :ascending_name_order, -> (page) {
    where(active: true).order(name: :asc).page(page).per(PER_PAGE_ITEMS)
  }

  scope :search, -> (query) {
    where("name LIKE ? AND active = true", "#{query.to_s}").order(name: :asc).page(1).per(PER_PAGE_ITEMS)
  }

  def deactivate
    update(active: false)
  end

  def set_role
    self.active = true
    self.name.upcase!
  end

  def set_update_role
    self.name.upcase!
  end
end
