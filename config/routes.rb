Rails.application.routes.draw do
  resources :posts, only: [:create, :new] do
    resources :comments, only: [:create, :new], as: 'comments' do
      post "likes", to: 'likes#comment_likes_create'
      delete "likes", to: 'likes#comment_likes_destroy'
    end
    post "likes", to: 'likes#post_likes_create'
    delete "likes", to: 'likes#post_likes_destroy'
  end
  devise_for :users
  root "site#index"
end
