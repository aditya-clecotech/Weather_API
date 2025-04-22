Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :weather, only: %i[index]
  resources :notification, only: %i[index]

end
