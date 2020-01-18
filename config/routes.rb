Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: { registrations: 'registrations' }

  ActiveAdmin.routes(self)

  get 'home/index'

  authenticate :user do
    resources :campaigns do
      resources :locations, defaults: { format: 'json' } do
        resources :buildings
      end
      resources :main_quests, defaults: { format: 'json' } do
        resources :quests
      end
    end

    resources :creatures
    resources :items
    resources :characters
  end

  unauthenticated do
    resources :creatures, only: %i[index show]
    resources :items, only: %i[index show]
    resources :characters, only: %i[index show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
end
