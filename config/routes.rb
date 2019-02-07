Rails.application.routes.draw do
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root 'home#index'
  resources :produtos,  only: [:index, :show]
  resources :produtores,  only: [:show]
end
