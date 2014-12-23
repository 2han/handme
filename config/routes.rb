Rails.application.routes.draw do
  get "payment/index"
  post "payment/purchase"
  get "payment/purchased"
  root 'about#index'
  get "mypage/applying"
  get "mypage/applied"
  get "about/index"
  match '/about', to:'about#index', via:'get'
  # match '/signin',  to: 'sessions#new',         via: 'get'
  # match '/signout', to: 'sessions#destroy',     via: 'delete'

  devise_for :users, :controllers => {
  :registrations => "users/registrations",
  :omniauth_callbacks => "users/omniauth_callbacks"
}

  resources :users do
    member do
      get :applies, :reviewed, :reviewing
    end
  end


  resources :jobs

  resources :applies do
    member do
      get :approve
    end
  end

  resources :messages

  resources :mypages

  resources :reviews

  resources :tags

end