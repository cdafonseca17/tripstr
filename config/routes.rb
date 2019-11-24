Rails.application.routes.draw do
  # get 'activities/new'
  # get 'activities/create'
  # get 'activities/edit'
  # get 'activities/update'
  # get 'activities/save'
  # get 'activities/destroy'
  # get 'steps/new'
  # get 'steps/create'
  # get 'steps/edit'
  # get 'steps/save'
  # get 'steps/update'
  # get 'steps/destroy'

  devise_for :users
  root to: 'trips#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # resources trips:
    resources :users, only: [ :show ]
    resources :trips do
      resources :steps, only: [ :new, :create, :edit, :update, :destroy ] do
        resources :activities, only: [ :new, :create, :edit, :update, :destroy ]
      end
    end
    get "profile", to: "profile#index"
    get '/mytrips', to: 'pages#mytrips'
    get '/testedittrip', to: 'pages#testedittrip'
end
