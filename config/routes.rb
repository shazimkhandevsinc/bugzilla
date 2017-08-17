Rails.application.routes.draw do


  root 'home#index'

  devise_for :users, controllers: {registrations: "registrations"}

  resources :projects do
    resources :bugs do
      member do
      get :assign
      get :complete
    end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
