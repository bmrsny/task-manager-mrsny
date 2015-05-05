Rails.application.routes.draw do
  resources :lists
  resources :tasks
  resources :archive_lists

  root to: "lists#index"
end
