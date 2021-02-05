Rails.application.routes.draw do
  devise_for :users
  resources :requests, except: [:index, :destroy]
  root to: 'requests#new'
  get '/:token/confirm_email/', :to => "requests#confirm_email", as: 'confirm_email'
  get '/:token/reconfirm_email/', :to => "requests#reconfirm_email", as: 'reconfirm_email'
  get '/thank_you', to: 'pages#thank_you', as: 'thank_you'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
