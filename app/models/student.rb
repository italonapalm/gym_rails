class Student < ApplicationRecord
  belongs_to :address

  accepts_nested_attributes_for :address

  # Constants
  PER_PAGE_ITEMS = 6

  # Scopes
  scope :actives, -> (page) {
    where(active: true).page(page).per(PER_PAGE_ITEMS)
  }

  scope :search, -> (query) {
    where("full_name LIKE ? AND active = true", "#{query.to_s}").order(full_name: :asc).page(1).per(PER_PAGE_ITEMS)
  }

  def deactivate
    update(active: false)
  end


end
