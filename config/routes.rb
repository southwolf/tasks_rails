Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  resources :tasks
  get "/changes", to: "changes#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
