Rails.application.routes.draw do


  root 'hello#index'

  get "/homepage" => "hello#index", as: "home"
  get "/users" => "users#index", as: "users"
  get "/info" => "info#show", as: "info"
  get '/users/:id/verify' => 'users#verify', as: :verify_user
  get '/about' => "about#show", as: "about"
  post 'attendees/new' => "attendees/new", as: "new_attendee"

  resources :events
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, except: :index
  resources :attendees, except: :new

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"


  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post '/check', to: "attendees#check", as: "check"
  get '/send_sms', to: "attendees#send_sms", as: "send_sms"
  get '/send_code', to: "attendees#send_code", as: "send_code"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
