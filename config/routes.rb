Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root 'produtos#index'
  resources :produtos,  only: [:index, :show]
  resources :produtores,  only: [:show]
end
