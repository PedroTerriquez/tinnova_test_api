require 'spec_helper'

describe User do
	it 'Validations' do
		expect(subject).to have_many(:beer_users)
		expect(subject).to have_many(:beers)
	end

  context 'Instance methods' do
    let!(:user) { create(:user) }
    let!(:beer) { create(:beer) }
    it 'favorite_beer' do
      beer_user = create(:beer_user, user: user, beer: beer, favorite: true)
      expect(user.favorite_beer).to match_array beer
    end

    it 'set_favorite_beer' do
      beer_user = create(:beer_user, user: user, beer: beer, favorite: nil)
      user.set_favorite_beer(beer.id)
      expect(beer_user.reload.favorite).to eq true
    end
  end
end
