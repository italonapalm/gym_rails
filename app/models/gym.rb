class Gym < ApplicationRecord
  before_create :set_gym

  has_many :gym_students
  has_many :students, through: :gym_students

  # Constants
  PER_PAGE_ITEMS = 6

  # Validates
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates_uniqueness_of :name

  # Scopes
  scope :descending_order, -> (page) {
    where(active: true).order(created_at: :desc).page(page).per(PER_PAGE_ITEMS)
  }

  scope :actives, -> {
    where(active: true)
  }

  scope :search, -> (query) {
    where("name LIKE ? AND active = true", "#{query.to_s}").order(name: :asc).page(1).per(PER_PAGE_ITEMS)
  }

  def deactivate
    update(active: false)
  end

  def set_gym
    self.active = true
  end

end
