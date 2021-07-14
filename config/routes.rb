Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#root'
  resources :pets, only: [:index, :new, :create, :show, :destroy]
  resources :medications
  resources :doctors
  resources :prescriptions
  resources :owners

  get 'pets/:id/edit', to: 'pets#edit', as: :edit_pet
  patch 'pets/:id', to: 'pets#update'
  
  get 'owners/:id/pets/:id', to: 'owners#pet'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  post 'logout'  => 'sessions#destroy'
  get 'doctors_login' => 'doctors#login'
  post 'doctors_login' => 'doctors#access'
  post 'doctors_logout' => 'doctors#doc_log_out'
  get 'welcome' => 'welcome#root'
  get '/auth/facebook/callback' => 'sessions#fb_create'

 
end
