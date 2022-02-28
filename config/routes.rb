Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
  
  resources :books, only: [:new, :index, :create, :show, :destroy]
  resources :users, only: [:new, :index, :show, :destroy]
end
