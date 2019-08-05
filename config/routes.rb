Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'posts#home'
	resources :posts
  get 'post', to: 'posts#index'
  resources :user
  post 'reset' ,  to: 'user#reset'
  get 'reset_password' , to: 'user#reset_password'
  get 'signinpage', to: 'user#signin'
  post 'signup', to: 'user#signup'
  get 'logon', to: "auth#new"
  post 'login', to: 'auth#create'
  get 'logout', to: 'auth#logout'
  get 'admin', to: 'photos#admin'
#  scope shallow_path: "sekret" do
#   resources :posts do
#     resources :comments, shallow: true
#   end
# end
  resources :comments, only: [:index, :show] do 
    member do
      get :new
      post :create
    end
  end

  resources :likes, only: [:index] do 
    member do
      post :create
    end
  end
  resources :user do
    member do
      get :confirm_email
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# rails generate model Comment user_id:integer post 