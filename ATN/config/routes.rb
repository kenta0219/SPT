Rails.application.routes.draw do
  devise_for :admins
  devise_for :users


  #admin
  get 'admin' => 'admins#top_ad', as: 'top_ad'
  get 'admin/index' => 'admins#index_ad', as: 'index_ad'
  get 'admin/show' => 'admins#show_ad', as: 'show_ad'

  #user
  get '/' => 'users#top_item', as: 'top_item'
  get 'item/index' => 'users#index_item', as: 'index_item'
  get 'item/show' => 'users#show_item', as: 'show_item'
  get 'mypage' => 'users#mypage', as: 'user_mypage'
  get 'mypage/edit' => 'users#mypage_edit', as: 'mypage_edit'
  get 'new' => 'users#new_item', as: 'new_item'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
