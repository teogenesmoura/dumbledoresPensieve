Rails.application.routes.draw do
  resources :memory_lists
  resources :memory_lists do
  	resources :memory_items
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "memory_lists#index"
end
