Rails.application.routes.draw do
  use_doorkeeper

  devise_for :users, controllers: { sessions: "users/sessions" }

  root to: 'home#index'

  resources :users,         only: [:index, :show, :edit, :update]
  resources :affiliations,  only: [:new, :create]
  resources :invitations,   only: [:new, :create]

  namespace :api do
    namespace :v1 do
      get '/user', to: 'credentials#show'
    end
  end

end
