Rails.application.routes.draw do
  resources :tweets

  get 'tweets/index'

  get 'tweets/show'

  get 'tweets/new'

  get 'tweets/edit'

  root 'tweets#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
