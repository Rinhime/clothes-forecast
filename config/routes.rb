Rails.application.routes.draw do
  # devise_for :favorites
  # devise_for :comments
  # devise_for :posts
  # 顧客用
# URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  namespace :public do
    root to: "homes#top"
    resources :clothes, only: [:create, :index, :show]
    resources :users, only: [:show, :destoroy, :edit, :update, :withdraw]
    resources :posts, only: [:index, :show]
    resources :favorites, only: [:create, :destroy]
  end
  # 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
