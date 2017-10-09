class GymStudent < ApplicationRecord
  before_create :set_gym_student

  belongs_to :gym
  belongs_to :student

  accepts_nested_attributes_for :student
  accepts_nested_attributes_for :gym

  def set_gym_student
    self.active = true
    self.registration_date = DateTime.now
  end
end
