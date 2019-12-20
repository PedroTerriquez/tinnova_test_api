class Beer < ApplicationRecord
  validates :beer_id, uniqueness: { scope: :user_id, message: "Already seen" }
  #default_scope
  belongs_to :user
end
