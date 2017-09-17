class Gym < ApplicationRecord
  # Constants
  PER_PAGE_ITEMS = 6

  validates_presence_of :name

  # Scopes
  scope :descending_order, -> (page) {
    where(active: true).order(created_at: :desc).page(page).per(PER_PAGE_ITEMS)
  }

end
