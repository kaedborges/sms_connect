Rails.application.routes.draw do

  namespace :v1 do
    namespace :managers do
      #Session
      post          '/sessions'                                                   => 'sessions#new'
      #Managers
      get           '/'                                                           => 'managers#index'
      post          '/'                                                           => 'managers#new'
      delete        '/:id'                                                        => 'managers#destroy'
      get           '/:id'                                                        => 'managers#show'
      patch         '/:id/reset-password'                                         => 'managers#reset_manager_password'
      patch         '/:id/lock'                                                   => 'managers#lock'
      patch         '/:id/onlock'                                                 => 'managers#unlock'
    end
    namespace :users do
      # Registrations
      post        'registrations'                                                 =>  'registrations#new'
      post        'registrations/confirmation'                                    =>  'registrations#confirmation'
      #Session
      post        '/sessions'                                                     => 'sessions#new'
      #Users
      get         '/'                                                             => 'users#index'


    end
  end
end
