Rails.application.routes.draw do
  
  # resources :users do
  #   resources :tasks
  # end
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit] do
        resources :tasks, except: [:new, :edit, :update]
        put 'tasks/:id/completed', to: 'tasks#complete'
      end
    end
  end

end
