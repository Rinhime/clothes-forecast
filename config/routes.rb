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
    # タグの検索で使用する
    get "search_tag" => "post#search_tag"
    resources :clothes, only: [:create, :index, :show]
    resources :users, only: [:destoroy, :update] do
      member do
        get :favorites
      end
    end
    # get "/piblic/posts/show" => "posts#show"
    resources :posts, only: [:index, :create, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create]
    end
    
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
  
  
end