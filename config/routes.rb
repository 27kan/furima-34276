Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items do
    resources :orders, only: [:index, :create]
  end

  post 'like/:item_id', to: 'likes#like', as: 'like'
  delete 'like/:item_id', to: 'likes#unlike', as: 'unlike'
  
end
