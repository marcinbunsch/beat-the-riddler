Hackstrap::Application.routes.draw do

  get  'join' => 'join#new'
  post 'join' => 'join#create'

  resources :teams
  resources :puzzles do
    member do
      put 'take_a_guess'
    end
  end
  get "/rankings" => 'rankings#show'
  get "/api/rankings" => 'api/rankings#scoresheet'

  resources :users, only: [:show]


  get "/oauth/github" => 'oauth/github#new'
  get "/oauth/github/callback" => 'oauth/github#create'

  get "/oauth/twitter" => 'oauth/twitter#new'
  get "/oauth/twitter/callback" => 'oauth/twitter#create'

  get "/login" => 'oauth/sessions#new'
  get "/logout" => 'oauth/sessions#destroy'

  root :to => 'home#index'

end
