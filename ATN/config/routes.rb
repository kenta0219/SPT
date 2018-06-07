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
  get 'admin/index' => 'admins#index_ad', as: 'index_ad'
  get 'admin/show' => 'admins#show_ad', as: 'show_ad'

  #user

  get '/' => 'users#top_video', as: 'top_video'
  get 'new' => 'users#new_video', as: 'new_video'
  get 'video/index' => 'users#index_video', as: 'index_video'
  get 'video/show' => 'users#show_video', as: 'show_video'
  get 'video/edit' => 'users#edit_video', as: 'edit_video'
  post 'video/create' => 'users#create_video', as: 'create_video'
  patch 'video/update' => 'users#update_video', as: 'update_video'


  get 'mypage' => 'users#mypage', as: 'user_mypage'
  get 'user/edit' => 'users#edit_user', as: 'edit_user'
  patch 'user/:id/update' => 'users#update_user', as: 'update_user'
  delete 'user/:id/delete' => 'users#destroy_user', as: 'destroy_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
