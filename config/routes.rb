Rails.application.routes.draw do
  namespace :backoffice do
    get 'gyms/index'
  end

  root 'backoffice/gyms#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
