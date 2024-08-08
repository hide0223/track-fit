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
    get '/about', to: 'homes#about'

    get '/customers/my_page', to: 'customers#show', as: 'customer_my_page'
    get '/customers/information/edit', to: 'customers#edit', as: 'edit_customer_information'
    patch '/customers/information', to: 'customers#update', as:  'update_customer_information'
    get '/customers/unsubscribe', to: 'customers#unsubscribe',as: 'customer_unsubscribe'
    patch '/customers/withdraw',to: 'customers#withdraw', as: 'customer_withdraw'

    resources :records, only: [:index, :show, :edit, :create, :update, :destroy]
  end



  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
end
