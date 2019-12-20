# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Admin', last_name: 'Admin', username: 'admin', email: 'admin@factoro_test.com', password: 'admin', password_confirmation: 'admin')

def api
  @conn ||= Faraday.new(
    url: 'https://api.punkapi.com/v2',
    headers: {'Content-Type' => 'application/json'}

  )
end

def get_and_save_beers
  @api_beers = JSON.parse(api.get('beers').body)
  save_beers_database
end

def save_beers_database
  @api_beers.each do |beer|
    Beer.create(
      beer_id: beer['id'],
      name: beer['name'],
      tagline: beer['tagline'],
      description: beer['description'],
      abv: beer['abv'],
    )
  end
end

get_and_save_beers
