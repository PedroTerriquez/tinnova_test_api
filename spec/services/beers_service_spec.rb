require 'rails_helper'

describe BeersService, type: :service do
  let!(:beers) { create_list(:beer, 3) }
  let!(:user)  { create(:user) }

  describe 'process' do
    context 'with params' do
      it 'has name return 1 record' do
        beer = beers.last
        beer.update(name: 'edited')
        params = ActionController::Parameters.new(name: 'edited')
        subject = BeersService.new(user.id, params)
        expect(subject.process).to match_array beer
      end

      it 'has abv return 1 record' do
        beer = beers.last
        beer.update(abv: 999)
        params = ActionController::Parameters.new(abv: 999)
        subject = BeersService.new(user.id, params)
        expect(subject.process).to match_array beer
      end

      it 'has id return 1 record' do
        beer = beers.last
        params = ActionController::Parameters.new(id: beer.id)
        subject = BeersService.new(user.id, params)
        expect(subject.process).to match_array beer
      end
    end

    context 'without params' do
      it 'return all' do
        subject = BeersService.new(user.id)
        expect(subject.process).to eq beers
      end
    end

    context 'set seen_at for the user' do
      it 'saves the value on db' do
        beer = beers.last
        params = ActionController::Parameters.new(id: beer.id)
        BeersService.new(user.id, params).process
        expect(BeerUser.last.beer_id).to eq beer.id
      end
    end
  end
end
