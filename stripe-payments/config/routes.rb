Rails.application.routes.draw do
  resources :payments 
  post "payments/create" 
  get "payments/success"
  get "payments/cancel"
  root "payments#new"
end
