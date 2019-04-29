Rails.application.routes.draw do
  resources :posts do
  	#post 'comments', to: 'comments#create'
    resources :comments, only: [:create, :destroy]
  end
  root to: 'posts#index'
  get 'pages/personal', to: "pages#personal"
  get 'pages/tabl'
  get 'pages/custumizer'
  resources :pages do
    collection do
      get :searcher
    end
   end
  get 'posts/tagged', to: "posts#tagged", as: :tagged
  devise_for :users
  resources :users do
    resources :posts
  end
  
  resources :posts do 
    member do
      put "like", to: "posts#vote"
    end
  end
  resources :users do
    collection do
      post :edit_multiple
    end
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
