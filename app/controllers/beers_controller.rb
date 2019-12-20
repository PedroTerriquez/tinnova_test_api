class BeersController < ApplicationController
  before_action :authenticate!

  def index
    render json: {
      hello: @current_user.name
    }
  end

  def all
    get_and_save_beers
    render json: @api_beers
  end

  def beers_by_name
    return if params[:name].empty?
    req_params = { beer_name: params[:name] }
    get_and_save_beers(req_params)
  end

  def beers_by_abv(abv)
    return if params[:name].empty?
    req_params = { beer_name: params[:name] }
    get_and_save_beers(req_params)
  end

  def save_favorite(id)
    Beer.where(favorite: true).update(favorite: false)
    Beer.find(id).update(favorite: true)
  end

  private

  def api
    @conn ||= Faraday.new(
      url: 'https://api.punkapi.com/v2',
      headers: {'Content-Type' => 'application/json'}

    )
  end

  def get_and_save_beers(req_params = nil)
    @api_beers = JSON.parse(api.get('beers', req_params).body)
    save_beers_database
  end

  def save_beers_database
    return true
    @api_beers.each do |beer|
      Beer.create(
        id: beer['id'],
        name: beer['name'],
        tagline: beer['tagline'],
        description: beer['description'],
        abv: beer['abv'],
        seen_at: DateTime.now
      )
    end
  end
end
