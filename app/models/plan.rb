class Plan < ApplicationRecord
  has_and_belongs_to_many :benefits
  belongs_to :country, foreign_key: "countries_id", required: true, inverse_of: :plans

  validates :price_hundredths, numericality: {greater_than: 0, only_integer: true}
  validates :name, presence: true, uniqueness: { scope: :country}
  validates :description, presence: true
  validates :benefits, presence: true

  def price
    "#{format('%.2f', price_hundredths / 100.0)} #{country.currency}"
  end
end
