Rails.application.routes.draw do
  devise_for :favorites
  devise_for :comments
  devise_for :posts
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
