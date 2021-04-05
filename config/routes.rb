Rails.application.routes.draw do
  root to: 'sessions#welcome'

  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :time_logs, path: 'timer'
end
