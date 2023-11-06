Rails.application.routes.draw do
  devise_for :clothes
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
    # topのURL /public...
    get "/users/show" => "users#show"
    get "/users/show/eidt" => "users#edit"
    resources :clothes, only: [:create, :index, :show]
    resources :users, only: [:destoroy, :update, :withdraw]
    resources :posts, only: [:index, :show, :create]
    resources :favorites, only: [:create, :destroy]
  end
  # 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get "/homes" => "homes#top"
    resources :clothes, only: [:new, :create, :index, :show, :edit, :update]
    resources :users, only: [:index, :show]
    resources :posts, only: [:destroy, :index, :show]
    resources :comments, only: [:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
