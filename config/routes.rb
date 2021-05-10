Rails.application.routes.draw do
  root 'home#index'

  get 'home', to: 'home#index'

  post 'login', to: 'users#login'
	post 'sign_up', to: 'users#create'
end
