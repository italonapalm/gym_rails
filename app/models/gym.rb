class Gym < ApplicationRecord
  # Constants
  PER_PAGE_ITEMS = 6

  validates_presence_of :name

  # Scopes
  scope :descending_order, -> (page) {
    where(active: true).order(created_at: :desc).page(page).per(PER_PAGE_ITEMS)
  }

  scope :search, -> (query) {
    where("name LIKE ? AND active = true", "#{query.to_s}").order(name: :asc).page(1).per(PER_PAGE_ITEMS)
  }

  def deactivate
    update(active: false)
  end

end
