Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sclasses, :students, :users

  root 'sclasses#index'
end
