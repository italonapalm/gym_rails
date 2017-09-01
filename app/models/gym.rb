class Gym < ApplicationRecord

  # Constants
  QTT_PER_PAGE = 6

  validates_presence_of :name

  # Scopes
  scope :descending_order, -> (page) {
    order(created_at: :desc).page(page).per(QTT_PER_PAGE)
  }
end
