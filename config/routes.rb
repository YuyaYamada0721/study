Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root 'tops#index'

  devise_for :users
  resources :users, only: :show
  resources :blogs do
    resources :comments, controller: 'blogs/comments'
    resources :favorites, controller: 'blogs/favorites', only: %i[create destroy]
  end
end
