Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  get "/list_posts"       => "main#list_posts"
  get "/show_post/:id"    => "main#show_post"
  get "/new_post"         => "main#new_post"
  post "/create_post"     => "main#create_post"
  get "/edit_post/:id"    => "main#edit_post"
  post "/update_post/:id" => "main#update_post"
  post "/delete_post/:id" => "main#delete_post"
end
