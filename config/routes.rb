Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'homes/index'
  resources :patients do
    resources :comments
  end

  devise_for :users
  resources :categories
  root to: "homes#index"

  mount Ckeditor::Engine => '/ckeditor'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
