Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    devise_for :users
    root to: 'homes#top' #全体のトップ画面を/comで表示
    get 'home/about' => 'homes#about'

    resources :users, only: [:index, :show, :edit, :update] do#マイページ
        member do
            get :following, :followed
        end
    end
    resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do #本の投稿
        resource :favorites, only: [:create, :destroy]
        resources :book_comments, only: [:create, :destroy] #コメント
    end

    get 'relationships/create'
    get 'relationships/destroy'
    post 'follow/:id' => 'relationships#follow', as: 'follow'
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

end
