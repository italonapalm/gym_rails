Rails.application.routes.draw do
  devise_for :admins
  namespace :backoffice do
    resources :gyms do
      collection do
        get :autocomplete
      end
    end

  end

  root 'backoffice/gyms#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
