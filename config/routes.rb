Rails.application.routes.draw do
  resources :pontuations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: "pontuations#index"
end
