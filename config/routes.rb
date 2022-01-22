Rails.application.routes.draw do

  # get '/lists', to: 'lists#index'
  # get '/lists/:id', to: 'lists#show'
  # get '/list/new', to: 'lists#new'
  # post '/list/:id', to: 'lists#create'
  resources :lists, only: [:index, :new, :create, :show] do
    resources :bookmarks, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
