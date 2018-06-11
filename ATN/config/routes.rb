Rails.application.routes.draw do
  devise_for :views
  devise_for :admins, controllers: {
  	sessions:      'admin/sessions',
  	passwords:     'admin/passwords',
  	registrations: 'admin/registrations'
  }
  devise_for :users, controllers: {
  	sessions:      'user/sessions',
  	passwords:     'user/passwords',
  	registrations: 'user/registrations'
  }


  #admin
  get 'admin' => 'admins#top_ad', as: 'top_ad'
  get 'admin/show' => 'admins#show_ad', as: 'show_ad'
  get 'admin/page' => 'admins#admin_ad', as: 'admin_ad'
  get 'admin//:id/edit' => 'admins#admin_edit', as: 'edit_admin'
  post 'admin//create' => 'admins#admin_create', as: 'create_admin'
  patch 'admin//:id/update' => 'admins#admin_update', as: 'update_admin'
  delete 'admin//:id/delete' => 'admins#admin_delete', as: 'delete_admin'

  get 'admin/tag/merger' => 'admins#tag_merger', as: 'tag_merger'


  #user

  get '/' => 'users#top_video', as: 'top_video'
  get 'new' => 'users#new_video', as: 'new_video'
  get 'video/index' => 'users#index_video', as: 'index_video'
  get 'video/show' => 'users#show_video', as: 'show_video'
  get 'video/:id/edit' => 'users#edit_video', as: 'edit_video'
  post 'video/create' => 'users#create_video', as: 'create_video'
  patch 'video/:id/update' => 'users#update_video', as: 'update_video'
  delete 'video/:id/delete' => 'users#delete_video', as: 'delete_video'


  get 'mypage' => 'users#mypage', as: 'user_mypage'
  get 'user/:id/edit' => 'users#edit_user', as: 'edit_user'
  patch 'user/:id/update' => 'users#update_user', as: 'update_user'
  post 'user/create' => 'users#create_user', as: 'create_user'
  delete 'user/:id/delete' => 'users#delete_user', as: 'delete_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
