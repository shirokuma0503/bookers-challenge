Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
    devise_for :users
    root to: 'homes#top' #全体のトップ画面を/comで表示
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :users, only: [:show, :edit] #マイページ関連
    
end
