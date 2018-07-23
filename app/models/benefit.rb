class Benefit < ApplicationRecord
  has_and_belongs_to_many :plans

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
