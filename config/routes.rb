Rails.application.routes.draw do

  get 'landings/index'

  get 'users/index'

  devise_for :users

  devise_scope :user do
    authenticated :user do
  
      root 'tests#index', as: :authenticated_root
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
