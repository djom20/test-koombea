Forsquare::Application.routes.draw do

 #root :to => "foursquare#index"

  root :to => "sessions#new"

  resource :session do
    collection do
      get 'callback'
    end
  end

  resources :foursquare, only: [:index] do
    collection do
      get 'infouser'
      get 'find_user'
      get 'find_venues'
      get 'find_friends'
      get 'find_user_badges'
      get 'find_venue_tips'
    end
  end  

end
