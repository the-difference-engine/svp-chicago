Rails.application.routes.draw do

  get '/landings' => 'landings#index'

  get '/users' => 'users#index'
  get '/users/user' => 'users#show'


  devise_for :users

  devise_scope :user do
    authenticated :user do
  
      root 'users#home', as: :authenticated_root
    end

  unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  get '/questions' => 'questions#index'
  
  get '/questions/new' => 'questions#new'
  post '/questions' => 'questions#create'

  get 'questions/:id' => 'questions#show'

  get 'questions/:id/edit' => 'questions#edit'
  patch 'questions/:id' => 'questions#update'

  delete 'questions/:id' => 'questions#destroy'

end
