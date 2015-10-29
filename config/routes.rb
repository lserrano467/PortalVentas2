Rails.application.routes.draw do
  
  #Pagina principal
  root 'features#index'

  #Session
  resources :sessions, only: [:new, :create, :destroy]
  
  #Categoria
  resources :categories

  #Ruta del Usuario
  resources :users 

  #Rutas para los comentarios por articulo
  resources :features do
    resources :comments
    resources :notifications
    member do
      get 'like'
    end
  end
  
  #Admin
  get 'admin/index'

  #Rutas del login
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  #Update articulo
  get '/admin/acceptFeature/:id' => 'admin#acceptFeature', :as =>'acceptFeature'
  #Update tipo de Usuario
  get '/admin/updateUserType/:id' => 'admin#updateUserType', :as =>'updateUserType'
   #Update category
  get '/admin/acceptCategory/:id' => 'admin#acceptCategory', :as =>'acceptCategory'
  #Betar commrnt
  get '/feature/changeCommentState/:id' => 'features#changeCommentState', :as =>'changeCommentState'
end
