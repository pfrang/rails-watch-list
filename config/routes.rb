Rails.application.routes.draw do

  # get '/lists', to: 'lists#index'
  # get '/lists/:id', to: 'lists#show'
  # get '/list/new', to: 'lists#new'
  # post '/list/:id', to: 'lists#create'
  root to: 'lists#index'
  resources :lists, only: [:new, :create, :show, :destroy] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
