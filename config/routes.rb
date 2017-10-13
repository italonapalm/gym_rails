Rails.application.routes.draw do

  namespace :backoffice do
    resources :gyms
    resources :students
    resources :roles
    resources :profiles

    get '/states/:state_id/cities', to: 'cities#cities_of_state'
  end

  devise_for :admins
  root 'backoffice/gyms#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
