Rails.application.routes.draw do
  resources :movies
  resources :clients
  
  root 'movies#index'  # Establecer cartelera de películas como página principal
end
