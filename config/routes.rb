Rails.application.routes.draw do
  delete "/logout" => "sessions#destroy"
  get "/login" => "sessions#new"
  resources :sessions, only: [:new, :create, :destroy]

  root "todo_lists#index"

  resources :todo_lists do
    resources :todo_items
  end
end
