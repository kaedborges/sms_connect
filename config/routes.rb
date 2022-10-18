Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    namespace :managers do
      
      #Session
      post          'sessions'                  => 'sessions#new'

      #Managers
      get           '/'                         => 'managers#index'
      post          '/'                         => 'managers#new'
    end
  end
end
