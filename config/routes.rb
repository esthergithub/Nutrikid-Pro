Rails.application.routes.draw do
  resources :patients do
    resources :comments
  end

  devise_for :users
  resources :categories
  root to: "categories#index"

  mount Ckeditor::Engine => '/ckeditor'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
