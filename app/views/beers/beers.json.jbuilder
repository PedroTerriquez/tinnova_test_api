json.ignore_nil!
json.array!(@beers) do |beer|
  json.extract! beer, :id, :name, :tagline, :description, :abv
  json.extract! @current_user.beer_users.find_by(beer: beer), :favorite, :seen_at
end


