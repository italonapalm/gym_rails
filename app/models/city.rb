class City < ApplicationRecord
  belongs_to :state

  accepts_nested_attributes_for :state

  # Scopes
  scope :cities_of_state, -> (state) {
    where(state: state).order(name: :asc)
  }
end
