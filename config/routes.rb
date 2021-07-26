Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #create custom route owners/:id/alpha show page but pet names are alphabetized

  root to: 'welcome#root'
  
  get    '/login'   => 'sessions#new'
  post   '/login'   => 'sessions#create'

  get '/owners/:id/alpha' => "owners#alpha_show"

  post 'logout'  => 'sessions#destroy'
  
  get 'owners/:id/pets/:pet_id', to: 'owners#pet'
  get 'owners/:id/pets/new', to: 'owners#new_pet'

  get 'pets/:id/edit', to: 'pets#edit', as: :edit_pet
  patch 'pets/:id', to: 'pets#update'
  
  get 'pets/:id/prescriptions/new', to: 'pets#new_prescription'

  get '/auth/:provider/callback' => 'sessions#omniauth'
  
  resources :owners do
    resources :pets
  end
  

  resources :medications
  resources :doctors
  resources :prescriptions
   
  resources :pets do
    resources :prescriptions
  end

  

 
end
