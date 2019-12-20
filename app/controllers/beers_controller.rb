class BeersController < ApplicationController
  before_action :authenticate!

  def index
    render json: {
        hello: @current_user.name
    }
  end

  def beers
    response = Faraday.get 'https://api.punkapi.com/v2/beers'
    binding.pry
    # Ask for all beers:
    # id
    #name
    #tagline
    #description
    #abv
  end

  def beer_by_name

  end

  def beer_by_abv

  end

  def save_favorite(id)
    Beer.where(favorite: true).update(favorite: false)
    Beer.find(id).update(favorite: true)
  end
end
