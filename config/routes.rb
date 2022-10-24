Rails.application.routes.draw do

  namespace :v1 do
    namespace :managers do
      #Session
      post          '/sessions'                                                   => 'sessions#new'

      #Users
      get           '/users/all'                                                  => 'users#index'
      post          '/users/create'                                               => 'users#new'
      delete        '/users/:id/user'                                             => 'users#destroy'
      get           '/users/:id/user'                                             => 'users#show'
      patch         '/users/:id/reset-password'                                   => 'users#reset_manager_password'
      patch         '/users/:id/lock'                                             => 'users#lock'
      patch         '/users/:id/onlock'                                           => 'users#unlock'

      #Managers
      get           '/'                                                           => 'managers#index'
      post          '/'                                                           => 'managers#new'
      delete        '/:id'                                                        => 'managers#destroy'
      get           '/:id'                                                        => 'managers#show'
      patch         '/:id/reset-password'                                         => 'managers#reset_manager_password'
      patch         '/:id/lock'                                                   => 'managers#lock'
      patch         '/:id/onlock'                                                 => 'managers#unlock'

      #Credits
      get           '/credits/global'                                             => 'credits#global'
      get           '/credits/user/:id'                                           => 'credits#user_credit'
      post          '/credits/user/:id/add'                                       => 'credits#user_add'
      post          '/credits/user/:id/remove'                                    => 'credits#user_remove'
      get          '/credits/user/:id/all'                                        => 'credits#user_credits'


    end
    namespace :users do
      # Registrations
      post        'registrations'                                                 =>  'registrations#new'
      post        'registrations/confirmation'                                    =>  'registrations#confirmation'
      #Session
      post        '/sessions'                                                     => 'sessions#new'

      #Users
      get         '/'                                                             => 'users#show'
      put         '/'                                                             => 'users#update'

      #Users
      get         '/credit/balance'                                               => 'credits#show_balance'
      get         '/creadit/all-transation'                                       => 'credits#show_transatio'


    end
  end
end
