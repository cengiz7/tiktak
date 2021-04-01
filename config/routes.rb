Rails.application.routes.draw do
  root to: 'sessions#welcome'

  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get  'dashboard'=> 'dashboard#index'

  resources :users
end
