Rails.application.routes.draw do

  namespace :backoffice do
    resources :gyms, except: [:show]
    resources :students, except: [:show]
    resources :roles, except: [:show]
    resources :profiles, except: [:show]
    resources :admins, except: [:show]

    get '/states/:state_id/cities', to: 'cities#cities_of_state'
  end

  devise_for :admins, :skip => [:registrations]
  root 'backoffice/gyms#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
