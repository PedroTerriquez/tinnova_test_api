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
    @beers = current_user.beers.where('name LIKE ?', '%' + params[:name] + '%')
    render json: @beers
  end

  def beers_by_abv
    @beers = current_user.beers.where(abv: params[:abv].to_f)
    render json: @beers
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
        seen_at: DateTime.now,
        user_id: @current_user.id
      )
    end
  end
end
