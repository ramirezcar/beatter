Rails.application.routes.draw do
  resources :licences
  resources :tracks
  resources :posts
  resources :skills
  resources :sales
  resources :comments
  get '/sales', to: "sales#create", as: "create_sale"

  devise_for :users

  root to: "home#index"

  get 'carts', to: "carts#show", as: "cart"
  delete 'carts', to: "carts#destroy"
  
  post 'line_items/:id/add', to: "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce', to: "line_items#reduce_quantity", as: "line_item_reduce"
  get 'line_items', to: "line_items#create", as: "line_items"
  delete 'line_items/:id', to: "line_items#destroy"
  get 'line_items/:id', to: "line_items#show", as: "line_item"

  
  get "profile", to: "profiles#index", as: :profiles_path
  get "profile/followers/:id", to: "profiles#followers", as: :followers
  get "profile/followed/:id", to: "profiles#followed", as: :followed
  get "profile/:id", to: "profiles#show", as: :profile
  post "profile/:id/follow", to: "profiles#follow_action", as: :follow_action
  post "profile/:id/unfollow", to: "profiles#unfollow_action", as: :unfollow_action

  post "post/:id/like", to: "likes#like_action", as: :like_action # Dislike se ejecuta con una validacion en el mismo metodo
  post "post/:id/comment", to: "posts#comment_action", as: :comment_action # Dislike se ejecuta con una validacion en el mismo metodo

  post "track/:id/add_to_cart", to: "cart#add_to_cart_action", as: :add_to_cart_action
  
  get '/search', to: "profiles#search"

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
