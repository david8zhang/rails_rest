Rails.application.routes.draw do
  resources :data
  post '/data/create', to: 'data#create'
end
