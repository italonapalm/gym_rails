class Student < ApplicationRecord
  before_create :set_student

  belongs_to :address
  has_many :gym_students
  has_many :gyms, through: :gym_students

  # Validates
  accepts_nested_attributes_for :address
  validate :has_gym_students

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

  def has_gym_students
    message = I18n.t "activerecord.errors.messages.association_is_blank", model: Gym.model_name.human
    errors.add(:base, message) if self.gym_students.size == 0
  end


end
