Rails.application.routes.draw do
  devise_for :users
  resources :requests, except: [:index, :destroy]
  root to: 'requests#new'
  get '/thank_you', to: 'pages#thank_you', as: 'thank_you'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
