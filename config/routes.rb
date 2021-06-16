Rails.application.routes.draw do
  devise_for :users

  root   "foods#index"
  resources :foods
  resources :users,  only:[:show]
  resources :randoms, only:[:index]
  
    get "randoms/search"
end
