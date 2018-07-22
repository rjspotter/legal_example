class Plan < ApplicationRecord
  has_and_belongs_to_many :benefits

  validates :price_hundredths, numericality: {greater_than: 0, only_integer: true}
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :country, inclusion: {in: ["US"]}
  validates :currency, inclusion: {in: ["USD"]}

  def price
    "#{format('%.2f', price_hundredths / 100.0)} #{currency}"
  end
end
