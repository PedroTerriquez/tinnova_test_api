class BeersController < ApplicationController
  before_action :authenticate!
  before_action :find_beers, except: %i[my_favorite_beer save_favorite]

  def index
  end

  def show
  end

  def beers_by_name
  end

  def beers_by_abv
  end

  def my_favorite_beer
    @beers = current_user.favorite_beer
    render "beers.json.jbuilder"
  end

  def save_favorite
    return if params[:beer_id].empty? || params[:beer_id].kind_of?(Array)
    render json: current_user.set_favorite_beer(params[:beer_id])
  end

  private

  def find_beers
    @beers = BeersService.new(params.dup, current_user.id).process
    render "beers.json.jbuilder"
  end
end
