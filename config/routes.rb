Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#root'
  
  get    '/login'   => 'sessions#new'
  post   '/login'   => 'sessions#create'

  post 'logout'  => 'sessions#destroy'

  get 'pets/:id/edit', to: 'pets#edit', as: :edit_pet
  patch 'pets/:id', to: 'pets#update'
  
  get 'owners/:id/pets/:pet_id', to: 'owners#pet'
  get 'pets/:id/prescriptions/:id', to: 'pets#prescription'


  get '/auth/:provider/callback' => 'sessions#omniauth'
  resources :owners do
    resources :pets
  end
  
  resources :pets, only: [:index, :new, :create, :show, :destroy] do 
    resources :prescriptions 
  end
    
  resources :medications
  resources :doctors
  resources :prescriptions
   
  resources :owners do
    resources :pets
  end

  

 
end
