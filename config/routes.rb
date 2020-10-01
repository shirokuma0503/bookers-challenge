Rails.application.routes.draw do
  devise_for :users
  get 'homes/top' #全体のトップ画面表示
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
