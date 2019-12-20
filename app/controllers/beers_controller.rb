class BeersController < ApplicationController
  before_action :authenticate!

  def index
    render json: {
      hello: @current_user.name
    }
  end

  def all
    render json: BeersService.new(params.dup, current_user.id).process
  end

  def show
    render json: BeersService.new(params.dup, current_user.id).process
  end

  def beers_by_name
    render json: BeersService.new(params.dup, current_user.id).process
  end

  def beers_by_abv
    render json: BeersService.new(params.dup, current_user.id).process
  end

  def save_favorite
    return if params[:beer_id].empty? || params[:beer_id].kind_of?(Array)
    render json: current_user.set_favorite_beer(params[:beer_id])
  end

  def my_favorite_beer
    render json: current_user.favorite_beer
  end
end
