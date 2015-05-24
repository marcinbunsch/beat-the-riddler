Hackstrap::Application.routes.draw do

  get "/oauth/github" => 'oauth/github#new'
  get "/oauth/github/callback" => 'oauth/github#create'

  get "/oauth/twitter" => 'oauth/twitter#new'
  get "/oauth/twitter/callback" => 'oauth/twitter#create'

  get "/login" => 'oauth/sessions#new'
  get "/logout" => 'oauth/sessions#destroy'

  root :to => 'home#index'

end
