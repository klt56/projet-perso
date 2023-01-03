Rails.application.routes.draw do
  get 'rooms/index'
  get 'page/home'
  resources :products
  get 'static_pages/index'
  get 'static_pages/secret'
 
  
  resources :rooms
   get "pages/home"

  root "static_pages#index"
  devise_for :users
  resources :customer_portal_sessions, only: [:create] 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'


    resources :products
    post "checkout/create", to: "checkout#create"
    resources :webhooks, only: [:create]
    get "success", to: "checkout#success"
    get "cancel", to: "checkout#cancel"

    
    post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
    delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"

    devise_scope :user do
      # Redirests signing out users back to sign-in
      get "users", to: "devise/sessions#new"


     
    end
    get 'user/:id', to: 'users#show', as: 'user'
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
