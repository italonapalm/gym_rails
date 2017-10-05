Rails.application.routes.draw do

  namespace :backoffice do
    resources :gyms
    resources :students

    resources :states do
      resources :cities
    end

  end

  devise_for :admins
  root 'backoffice/gyms#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
