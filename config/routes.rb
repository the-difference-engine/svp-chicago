Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/lois' => 'lois#index'
      get '/lois/:id' => 'lois#show'

      get '/questions' => 'questions#index'
      get '/questions/:id' => 'questions#show'
    end
  end

  get '/home' => 'landings#home'
  get '/thanks/:id' => 'landings#thanks'
  get '/ratings' => 'ratings#index'
  get '/ratings/new' => 'ratings#new'
  get '/ratings/:id' => 'ratings#show'
  post '/ratings' => 'ratings#create'
  get '/ratings/:id/edit' => 'ratings#edit'
  patch '/ratings/:id' => 'ratings#update'
  delete '/ratings/:id' => 'ratings#destroy'



  get '/users' => 'users#index'
  get '/users/user' => 'users#show'
  patch '/users/:id' => 'users#update'

  get '/lois' => 'lois#index'
  get '/lois/new' => 'lois#new'
  post '/lois' => 'lois#create'
  get '/lois/:id' => 'lois#show'
  get '/lois/:id/edit' => 'lois#edit'
  patch '/lois/:id' => 'lois#update'
  delete '/lois/:id' => 'lois#destroy'
  post '/sections' => 'sections#create'

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

  get '/questions/:id' => 'questions#show'

  get '/questions/:id/edit' => 'questions#edit'
  patch '/questions/:id' => 'questions#update'

  delete '/questions/:id' => 'questions#destroy'

end
