class BeersService
  def initialize(params, user_id)
    @params = params
    @user_id = user_id
  end

  def process
    @beers = Beer.all
    @beers = @beers.where(id: @params[:id]) if @params[:id]
    @beers = @beers.where('name LIKE ?', '%' + @params[:name] + '%') if @params[:name]
    @beers = @beers.where(abv: @params[:abv].to_f) if @params[:abv]
    beers_seen
    @beers
  end

  private

  def beers_seen
    @beers.ids.each do |id|
      BeerUser.create(beer_id: id, seen_at: DateTime.now, user_id: @user_id)
    end
  end
end
