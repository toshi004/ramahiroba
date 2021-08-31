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

  scope module: :public do
    devise_for :users, controllers: {
      sessions: 'public/devise/sessions',
      registrations: 'public/devise/registrations',
      passwords: 'public/devise/passwords'
    }
    resources :users, except: [:new, :create]
      get 'my_page', to: 'users#my_page'
      get 'unsubscribe', to: 'users#unsubscribe'
    get 'posts/thanks', to: 'posts#thanks'
    get 'posts/pick_up', to: 'posts#pick_up'
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
      resources :post_favorites, only: [:create, :destroy]
    end
    resources :user_favorites, only: [:create, :destroy]
    resources :tags, only: [:index]
    get 'inquiry/new', to: 'inquiry#new'
    post 'inquiry/confirm', to: 'inquiry#confirm'
    post 'inquiry/thanks', to: 'inquiry#thanks'
  end

end