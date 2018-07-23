class Country < ApplicationRecord

  has_many :plans, foreign_key: :countries_id

end
