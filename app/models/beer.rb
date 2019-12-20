class Beer < ApplicationRecord
  validates :beer_id, uniqueness: { scope: :user_id, message: "Already seen" }
  belongs_to :user
end
