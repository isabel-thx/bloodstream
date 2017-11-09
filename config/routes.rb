Rails.application.routes.draw do


  get 'admin/show'

  root 'hello#index'

  get "/homepage" => "hello#index", as: "home"
  get "/users" => "users#index", as: "users"
  get "/info" => "info#show", as: "info"
  get '/users/:id/verify' => 'users#verify', as: :verify_user

  resources :events
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"


root 'users#index'
resources :users, except: :index
resources :reward_codes


get "/auth/:provider/callback" => "sessions#create_from_omniauth"
get '/check', to: "reward_codes#check", as: "check"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
