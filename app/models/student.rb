class Student < ApplicationRecord
  before_create :set_student

  belongs_to :address
  has_many :gym_students
  has_many :gyms, through: :gym_students

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :gym_students, reject_if: :all_blank, allow_destroy: true

  # Validates

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

  def set_student
    self.active = true

    if self.full_name.split.count > 1
      self.first_name = self.full_name.split.first
      self.last_name = self.full_name.split.last
    else
      self.last_name = self.name
      self.first_name = self.name
    end
  end


end
