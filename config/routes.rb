Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#root'
  resources :pets, only: [:index, :new, :show, :destroy]
  resources :medications
  resources :doctors
  resources :prescriptions
  resources :owners

  get 'pets/:id/edit', to: 'pets#edit', as: :edit_pet
  patch 'pets/:id', to: 'pets#update' 

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  post 'logout'  => 'sessions#destroy'

  get 'welcome' => 'welcome#root'

 
end
