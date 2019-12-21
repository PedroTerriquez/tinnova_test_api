class BeersService
  def initialize(user_id, params = nil)
    @params = params
    @user_id = user_id
  end

  def process
    @beers = Beer.all
    @beers = @beers.where(id: @params[:id]) if @params[:id]
    @beers = @beers.where('name LIKE ?', '%' + @params[:name] + '%') if @params[:name]
    @beers = @beers.where(abv: @params[:abv].to_f) if @params[:abv]
    beers_seen unless @params.nil?
    @beers
  end

  private

  def beers_seen
    @beers.ids.each do |id|
      beer_user = BeerUser.find_or_create_by(user_id: @user_id, beer_id: id)
      beer_user.update_attributes(seen_at: DateTime.now)
    end
  end
end
