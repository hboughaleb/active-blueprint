Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

    resources :users, only: [ :show ]

    resources :projects, only: [ :create, :new, :show, :index ] do
      resources :tasks
    end
    get "/all_my_tasks", to: "tasks#full_index", as: "all_tasks"
  root to: 'pages#home'

mount Attachinary::Engine => "/attachinary"
end
