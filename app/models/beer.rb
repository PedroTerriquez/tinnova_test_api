class Beer < ApplicationRecord
  validates :beer_id, uniqueness: { scope: :user_id, message: "Already seen" }
  validates :favorite, uniqueness: { scope: :user_id, message: "Already have a favorite" }
  belongs_to :user
end
