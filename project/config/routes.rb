Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :places, except: [:index, :delete] do
    resources :reviews, except: [:index, :show]
    collection do
      get 'search'
    end
  end

  resource :pages do
    member do
      post :change_curr
    end
  end


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  get "/about" => "pages#about"
  get "/map" => "pages#map"
  get "/profile" => "pages#profile"
  get "/places" => redirect("/map")
  get "/new_place" => "places#new"
  get "/users/:id" => "users#show"
  get "/places/:id/reviews" => "reviews#show_all"
  get "users/:id/edit" => "users#edit", as: "edit_user"
  resources :users

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/users/:id/edit" => "devise/registrations#edit"
    #where omniauth_callback is the controller I made when following the Railscast
    get "users/auth/facebook/setup" => "omniauth_callbacks#setup"
  end

end
