Rails.application.routes.draw do
  resources :articles
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



  #article
  get '/' => 'articles#top_video', as: 'top_video'
  get 'article/index' => 'articles#index_video', as: 'index_video'
  get 'new' => 'articles#new_video', as: 'new_video'
  get 'article/:id' => 'articles#show_video', as: 'show_video'


  get 'article/:id/edit' => 'articles#article_edit', as: 'article_edit'
  post 'article/create' => 'articles#create', as: 'article_create'


  resources :articles do
    resources :post_comments, only: [:create, :destroy]
  end






  #admin
  get 'admin' => 'admins#top_ad', as: 'top_ad'
  get 'admin/show' => 'admins#show_ad', as: 'show_ad'
  get 'admin/page' => 'admins#admin_ad', as: 'admin_ad'
  get 'admin/:id/edit' => 'admins#edit_admin', as: 'admin_edit'
  post 'admin/create' => 'admins#admin_create', as: 'create_admin'
  patch 'admin/:id/update' => 'admins#admin_update', as: 'update_admin'
  delete 'admin/:id/delete' => 'admins#admin_delete', as: 'delete_admin'

  get 'admin/tag/new' => 'admins#new_tag', as: 'new_tag'
  get 'admin/tag/index' => 'admins#index_tag', as: 'index_tag'
  post 'admin/tag/create' => 'admins#create_tag', as: 'tag_create'

  get 'admin/article/create' => 'admins#article_create', as: 'article_create_ad'
  delete 'admin/article/:id/delete' => 'admins#destroy', as: 'destroy_ad'






  #user
  get 'video/:id/edit' => 'users#edit_video', as: 'edit_video'
  post 'video/create' => 'users#create_video', as: 'create_video'
  patch 'video/:id/update' => 'users#update_video', as: 'update_video'


  get 'mypage' => 'users#mypage', as: 'user_mypage'
  get 'user/:id/edit' => 'users#edit_user', as: 'edit_user'
  patch 'user/:id/update' => 'users#update_user', as: 'update_user'
  post 'user/create' => 'users#create_user', as: 'create_user'
  delete 'user/:id/delete' => 'users#delete_user', as: 'delete_user'
  delete 'user/:id/delete/article' => 'articles#destroy', as: 'destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


