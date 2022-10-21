Rails.application.routes.draw do

  namespace :v1 do
    namespace :managers do
      #Session
      post          '/sessions'                  => 'sessions#new'
      #Managers
      get           '/'                         => 'managers#index'
      post          '/'                         => 'managers#new'
      delete        '/:id'                      => 'managers#destroy'
      get           '/:id'                      => 'managers#show'
      post          '/:id/reset-password'       => 'managers#reset_manager_password'
    end
  end
end
