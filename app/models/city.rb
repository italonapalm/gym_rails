class City < ApplicationRecord
  belongs_to :state

  accepts_nested_attributes_for :state
end
