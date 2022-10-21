Rails.application.routes.draw do

  namespace :v1 do
    namespace :managers do
      #Session
      post          '/sessions'                  => 'sessions#new'
      #Managers
      get           '/'                         => 'managers#index'
      post          '/'                         => 'managers#new'
      delete        '/:id'                      => 'managers#destroy'
    end
  end
end
