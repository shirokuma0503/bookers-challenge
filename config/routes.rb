Rails.application.routes.draw do

    devise_for :users
    root to: 'homes#top' #全体のトップ画面を/comで表示
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :users, only: [:create, :index, :show, :edit, :update] #マイページ
    resources :books #本の投稿
end
