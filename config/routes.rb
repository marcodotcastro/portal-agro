# == Route Map
#
#                         Prefix Verb       URI Pattern                                                                              Controller#Action
#                     home_index GET        /home/index(.:format)                                                                    home#index
#         new_admin_user_session GET        /admin/login(.:format)                                                                   active_admin/devise/sessions#new
#             admin_user_session POST       /admin/login(.:format)                                                                   active_admin/devise/sessions#create
#     destroy_admin_user_session DELETE|GET /admin/logout(.:format)                                                                  active_admin/devise/sessions#destroy
#        new_admin_user_password GET        /admin/password/new(.:format)                                                            active_admin/devise/passwords#new
#       edit_admin_user_password GET        /admin/password/edit(.:format)                                                           active_admin/devise/passwords#edit
#            admin_user_password PATCH      /admin/password(.:format)                                                                active_admin/devise/passwords#update
#                                PUT        /admin/password(.:format)                                                                active_admin/devise/passwords#update
#                                POST       /admin/password(.:format)                                                                active_admin/devise/passwords#create
#                     admin_root GET        /admin(.:format)                                                                         admin/dashboard#index
#  batch_action_admin_produtores POST       /admin/produtores/batch_action(.:format)                                                 admin/produtores#batch_action
#               admin_produtores GET        /admin/produtores(.:format)                                                              admin/produtores#index
#                                POST       /admin/produtores(.:format)                                                              admin/produtores#create
#             new_admin_produtor GET        /admin/produtores/new(.:format)                                                          admin/produtores#new
#            edit_admin_produtor GET        /admin/produtores/:id/edit(.:format)                                                     admin/produtores#edit
#                 admin_produtor GET        /admin/produtores/:id(.:format)                                                          admin/produtores#show
#                                PATCH      /admin/produtores/:id(.:format)                                                          admin/produtores#update
#                                PUT        /admin/produtores/:id(.:format)                                                          admin/produtores#update
#                                DELETE     /admin/produtores/:id(.:format)                                                          admin/produtores#destroy
#  batch_action_admin_categorias POST       /admin/categorias/batch_action(.:format)                                                 admin/categorias#batch_action
#               admin_categorias GET        /admin/categorias(.:format)                                                              admin/categorias#index
#                                POST       /admin/categorias(.:format)                                                              admin/categorias#create
#            new_admin_categoria GET        /admin/categorias/new(.:format)                                                          admin/categorias#new
#           edit_admin_categoria GET        /admin/categorias/:id/edit(.:format)                                                     admin/categorias#edit
#                admin_categoria GET        /admin/categorias/:id(.:format)                                                          admin/categorias#show
#                                PATCH      /admin/categorias/:id(.:format)                                                          admin/categorias#update
#                                PUT        /admin/categorias/:id(.:format)                                                          admin/categorias#update
#                                DELETE     /admin/categorias/:id(.:format)                                                          admin/categorias#destroy
#    batch_action_admin_produtos POST       /admin/produtos/batch_action(.:format)                                                   admin/produtos#batch_action
#                 admin_produtos GET        /admin/produtos(.:format)                                                                admin/produtos#index
#                                POST       /admin/produtos(.:format)                                                                admin/produtos#create
#              new_admin_produto GET        /admin/produtos/new(.:format)                                                            admin/produtos#new
#             edit_admin_produto GET        /admin/produtos/:id/edit(.:format)                                                       admin/produtos#edit
#                  admin_produto GET        /admin/produtos/:id(.:format)                                                            admin/produtos#show
#                                PATCH      /admin/produtos/:id(.:format)                                                            admin/produtos#update
#                                PUT        /admin/produtos/:id(.:format)                                                            admin/produtos#update
#                                DELETE     /admin/produtos/:id(.:format)                                                            admin/produtos#destroy
#                admin_dashboard GET        /admin/dashboard(.:format)                                                               admin/dashboard#index
# batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)                                                admin/admin_users#batch_action
#              admin_admin_users GET        /admin/admin_users(.:format)                                                             admin/admin_users#index
#                                POST       /admin/admin_users(.:format)                                                             admin/admin_users#create
#           new_admin_admin_user GET        /admin/admin_users/new(.:format)                                                         admin/admin_users#new
#          edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                                                    admin/admin_users#edit
#               admin_admin_user GET        /admin/admin_users/:id(.:format)                                                         admin/admin_users#show
#                                PATCH      /admin/admin_users/:id(.:format)                                                         admin/admin_users#update
#                                PUT        /admin/admin_users/:id(.:format)                                                         admin/admin_users#update
#                                DELETE     /admin/admin_users/:id(.:format)                                                         admin/admin_users#destroy
#  batch_action_admin_qualidades POST       /admin/qualidades/batch_action(.:format)                                                 admin/qualidades#batch_action
#               admin_qualidades GET        /admin/qualidades(.:format)                                                              admin/qualidades#index
#                                POST       /admin/qualidades(.:format)                                                              admin/qualidades#create
#            new_admin_qualidade GET        /admin/qualidades/new(.:format)                                                          admin/qualidades#new
#           edit_admin_qualidade GET        /admin/qualidades/:id/edit(.:format)                                                     admin/qualidades#edit
#                admin_qualidade GET        /admin/qualidades/:id(.:format)                                                          admin/qualidades#show
#                                PATCH      /admin/qualidades/:id(.:format)                                                          admin/qualidades#update
#                                PUT        /admin/qualidades/:id(.:format)                                                          admin/qualidades#update
#                                DELETE     /admin/qualidades/:id(.:format)                                                          admin/qualidades#destroy
#                 admin_comments GET        /admin/comments(.:format)                                                                admin/comments#index
#                                POST       /admin/comments(.:format)                                                                admin/comments#create
#                  admin_comment GET        /admin/comments/:id(.:format)                                                            admin/comments#show
#                                DELETE     /admin/comments/:id(.:format)                                                            admin/comments#destroy
#                           root GET        /                                                                                        home#index
#              produtor_produtos GET        /produtores/:produtor_id/produtos(.:format)                                              produtos#index
#               produtor_produto GET        /produtores/:produtor_id/produtos/:id(.:format)                                          produtos#show
#                     produtores GET        /produtores(.:format)                                                                    produtores#index
#                       produtor GET        /produtores/:id(.:format)                                                                produtores#show
#             rails_service_blob GET        /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#      rails_blob_representation GET        /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#             rails_disk_service GET        /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#      update_rails_disk_service PUT        /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#           rails_direct_uploads POST       /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#index'
  resources :produtores, only: [:index, :show] do
    resources :produtos, only: [:index, :show]
  end
end
