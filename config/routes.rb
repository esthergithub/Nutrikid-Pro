Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get 'homes/index'
  resources :patients do
    resources :comments
  end

  devise_for :users
  resources :categories
  root to: "homes#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
