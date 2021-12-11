Rails.application.routes.draw do
  get 'test1/index'
  post 'test1/add_person'
  get 'test1/add_person'
  get 'teme/tst'
  get 'temes/tst'
  post 'relatares/test1'
  get 'relatares/iubire'
  get 'relatares/index1'
  post 'relatares/index1'
  get 'relatares/relatarile_mele'
  get 'relatares/relatarit'
  post 'relatares/relatarit'
  get 'relatares/seteaza_tema'
  post 'relatares/seteaza_tema'
  resources :temes
  resources :calitatis
  resources :relatares
  resources :admins
  #get 'relatares/edit/:user_id', to: "relatares#edit"
  get "relatares", to: "relatares#index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  devise_for :users
  
  
  get 'relatari/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  

end
