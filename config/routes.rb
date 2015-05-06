Rails.application.routes.draw do
  resources :lists
  resources :tasks
  resources :archive_lists
  resources :complete_tasks
  resources :incomplete_tasks

  root to: "lists#index"
end
