Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html]

  root :to =>"homes#about"

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :public do
    resources :customers, only: [:show, :edit, :update] do
     resource :relationships, only: [:create, :destroy]
    	get "followings" => "relationships#followings", as: "followings"
    	get "followers" => "relationships#followers", as: "followers"
    end
    get '/customers/unsubscribe/:id', to: 'customers#unsubscribe', as: 'customer_unsubscribe'
    patch '/customers/withdraw/:id', to: 'customers#withdraw', as: 'customer_withdraw'


    resources :meals, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :meal_comments, only: [:create, :destroy]
      resource :meal_favorites, only: [:create, :destroy]
    end
    resources :trainings, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :training_comments, only: [:create, :destroy]
      resource :training_favorites, only: [:create, :destroy]
    end
  end



  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :categories, only: [:index, :create, :edit, :update]
    resources :records, only: [:index, :show, :edit, :create, :update, :destroy]
 end
end
