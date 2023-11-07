Rails.application.routes.draw do
  get 'posts/new'
  post 'posts/create', as: :posts
  get 'site/index'
  devise_for :users
  root "site#index"
end
