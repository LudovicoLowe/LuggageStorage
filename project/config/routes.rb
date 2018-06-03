Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :places, except: [:index, :delete] do
    resources :reviews, except: [:index, :show]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  get "/about" => "pages#about"
  get "/map" => "pages#map"
  get "/profile" => "pages#profile"
  get "/places" => redirect("/map")
  get "/new_place" => "places#new"

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/edit_profile" => "devise/registrations#edit"
    #where omniauth_callback is the controller I made when following the Railscast
    get "users/auth/facebook/setup" => "omniauth_callbacks#setup"
  end

end
