require 'rails_helper'

RSpec.describe BeersController, type: :controller do
  let!(:beers) { create_list(:beer, 3) }
  let!(:user)  { create(:user) }

  before do
    request.headers.merge! log_in(user)
    @controller = BeersController.new
  end

  describe 'GET /index' do
    context 'with valid credentials sent' do
      it 'responds with 200 status' do
        get :index, format: :json
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /show' do
    context 'with valid credentials sent' do
      it 'responds with 200 status' do
        get :show, params: { id: beers.first.id }, format: :json

        expect(response).to be_successful
      end
    end
  end

  describe 'POST /beers_by_name' do
    context 'with valid credentials sent' do
      it 'responds with 200 status' do
        post :beers_by_name, params: { name: beers.first.name }, format: :json
        expect(response).to be_successful
      end
    end
  end

  describe 'POST /beers_by_abv' do
    context 'with valid credentials sent' do
      it 'responds with 200 status' do
        post :beers_by_abv, params: { name: beers.first.name }, format: :json
        expect(response).to be_successful
      end
    end
  end

  describe 'GET /my_favorite_beer' do
    context 'with valid credentials sent' do
      it 'responds with 200 status' do
        get :my_favorite_beer, format: :json
        expect(response).to be_successful
      end
    end
  end
end

