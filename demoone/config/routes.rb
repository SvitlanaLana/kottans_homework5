Rails.application.routes.draw do
  resources :users
  resources :observations, only: [:show, :index]
  post 'sign_in' => 'session#sign_in'
  delete 'sign_out' => 'session#sign_out'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
