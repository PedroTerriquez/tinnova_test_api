Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#login'

  resources :beers do
    collection do
      get :all
      post :beers_by_name
      post :beers_by_abv
      post :save_favorite
    end
  end
end
