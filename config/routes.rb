Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # devise_scope :customers do
  #   post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  # end

  namespace :public do
    get '/', to: 'homes#about'

    resources :customers, only: [:show, :edit, :update]
    get '/customers/unsubscribe', to: 'customers#unsubscribe',as: 'customer_unsubscribe'
    patch '/customers/withdraw',to: 'customers#withdraw', as: 'customer_withdraw'

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
