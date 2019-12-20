class BeerUser < ApplicationRecord
  validates :beer_id, uniqueness: { scope: :user_id, message: "Already seen" }
  validates :favorite, uniqueness: { scope: :user_id, message: "Already have a favorite" }, allow_nil: true
  belongs_to :user
  belongs_to :beer
end
