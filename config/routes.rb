Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root 'blogs#index'

  resources :users, only: :show
  resources :blogs do
    resources :favorites, controller: 'blogs/favorites', only: %i[create destroy]
  end
end
