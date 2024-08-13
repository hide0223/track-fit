Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html]

  root :to =>"homes#about"

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # devise_scope :customers do
  #   post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  # end

  namespace :public do


    resources :customers, only: [:show, :edit, :update]
    get '/customers/unsubscribe/:id', to: 'customers#unsubscribe', as: 'customer_unsubscribe'
    patch '/customers/withdraw/:id', to: 'customers#withdraw', as: 'customer_withdraw'

    resources :meals, only: [:index, :show, :edit, :create, :update, :destroy]
    resources :trainings, only: [:index, :show, :edit, :create, :update, :destroy]
  end



  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :categories, only: [:index, :create, :edit, :update]
    resources :records, only: [:index, :show, :edit, :create, :update, :destroy]
 end
end
