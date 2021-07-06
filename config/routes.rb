Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#root'
  resources :pets
  resources :medications
  resources :doctors
  resources :prescriptions
  resources :owners
  resources :sessions

 

  get 'welcome' => 'welcome#root'

 
end
