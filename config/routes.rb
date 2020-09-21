Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :posts do
    resources :helpfuls, only: [:create, :destroy]
  end
  resources :users
end
