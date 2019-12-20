class User < ApplicationRecord
  has_secure_password
  has_many :beer_users
  has_many :beers, through: :beer_users

  def favorite_beer
    beers.where(beer_users: {user_id: self.id,favorite: true})
  end

  def set_favorite_beer(beer_id)
    self.beer_users.where(favorite: true).update(favorite: nil)
    self.beer_users.where(beer_id: beer_id).update(favorite: true)
  end

  def to_token
    {
        id: self.id,
        name: self.name,
        username: self.username,
    }
  end
end
