class Condition < ApplicationRecord

  validates :date, :comment, presence: true
  belongs_to :student
end
