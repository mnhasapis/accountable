Rails.application.routes.draw do
  resources :relationships
  resources :comments
  resources :goals do
    member do
      patch :complete
    end
  end
  devise_for :users

  get "profiles" => "profiles#index"

  get "mypage" => "profiles#feed"

  get "profiles/:id" => "profiles#show", as: :profile

  get 'goals/index' => "goals#index"

  root 'welcome#index'


end
