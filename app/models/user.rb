class User < ApplicationRecord
  has_secure_password
  has_many :beers

  def favorite_beer
    Beer.where(favorite: true, user_id: self.id)
  end

  def to_token
    {
        id: self.id,
        name: self.name,
        username: self.username,
    }
  end
end
