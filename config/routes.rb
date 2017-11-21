Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

    resources :users, only: [ :show ]

    resources :projects do
      resources :specialties do
        resources :tasks
      end
    end
    get "/all_my_tasks", to: "tasks#full_index", as: "all_tasks"
  root to: 'pages#home'
  post "projects/:project_id/gantt", to: "specialties#gantt_update", as: "specialties_gantt_update"
  post "projects/:project_id/specialties/:specialty_id/gantt", to: "tasks#gantt_update", as: "tasks_gantt_update"

mount Attachinary::Engine => "/attachinary"
end
