Rails.application.routes.draw do
  root to: 'public/homes#top'
  get 'about', to: 'public/homes#about'


  devise_for :admins, skip: :all

  namespace :admin do
    devise_scope :admin do
      get 'sign_in', to: 'devise/sessions#new'
      post 'sign_in', to: 'devise/sessions#create'
      delete 'sign_out', to: 'devise/sessions#destroy'
    end
    resources :users, only: [:index, :show, :update]
    resources :post_comments, only: [:index, :show, :destroy]
  end

  devise_for :users
  scope module: :public do
    resources :users, except: [:new, :create]
      get 'my_page', to: 'users#my_page'
      get 'unsubscribe', to: 'users#unsubscribe'
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resources :goods, only: [:create, :destroy]
      resources :post_favorites, only: [:create, :destroy]
    end
    resources :user_favorites, only: [:create, :destroy]
    resources :tags, only: [:index]
  end

end