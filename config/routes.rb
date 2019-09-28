Rails.application.routes.draw do
  root "terminologies#index"
  resources :terminologies
end
