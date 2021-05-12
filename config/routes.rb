Rails.application.routes.draw do
    root 'items#index'

    get 'items', to: 'items#index'

    post 'login', to: 'users#login'
    post 'sign_up', to: 'users#create'
end
