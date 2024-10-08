Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html]

  root :to =>"homes#about"

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :customer do
      post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  get "customers", to: "public/customers#index"

  namespace :public do
    resources :customers, only: [:index, :show, :edit, :update] do
      member do
        get :training_favorites
        get :meal_favorites
      end
      resource :relationships, only: [:create, :destroy]
        get "followings" => "relationships#followings", as: "followings"
        get "followers" => "relationships#followers", as: "followers"
    end
    patch '/customers/withdraw/:id',to: 'customers#withdraw', as: 'customer_withdraw'
    get '/customers/unsubscribe/:id', to: 'customers#unsubscribe', as: 'customer_unsubscribe'
    get "customer/search" => "searches#customer_search", as: 'customer_search'
    get "meal/search" => "searches#meal_search", as: 'meal_search'
    get "training/search" => "searches#training_search", as: 'training_search'

    resources :meals, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :meal_comments, only: [:create, :destroy]
      resource :meal_favorites, only: [:create, :destroy]
    end
    get 'meal_f/search' => 'meals#search'

    resources :trainings, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :training_comments, only: [:create, :destroy]
      resource :training_favorites, only: [:create, :destroy]
    end
    get 'training_f/search' => 'trainings#search'
  end



  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :meals, only: [:index, :show, :destroy]
    resources :meal_comments, only: [:index, :show, :destroy]

    resources :trainings, only: [:index, :show, :destroy]
    resources :training_comments, only: [:index, :show, :destroy]
    resources :customers, only: [:index, :show, :edit, :update, :destroy]

    root to: 'admin/homes#top'
    get "search" => "searches#search"
 end
end
