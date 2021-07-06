Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#root'
  resources :pets
  resources :medications
  resources :doctors
  resources :prescriptions
  resources :owners

  get 'pets/new' => 'pets#new'
  post 'pets/new' => 'pets/:id'

  get 'welcome' => 'welcome#root'

  resources :owners do
    get :login, on: :collection, as: :login
    get :new, on: :collection, as: :new 
    get :show, on: :collection, as: :show
  end
end
