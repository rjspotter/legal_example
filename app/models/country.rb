class Country < ApplicationRecord

  has_many :plans, foreign_key: :countries_id

  scope :with_plans, -> { where(id: Plan.distinct(:countries_id).pluck(:countries_id))}
end
