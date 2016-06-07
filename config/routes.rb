Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
  
      root 'users#show', as: :authenticated_root
    end

  unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  namespace :api do
    namespace :v1 do
      get '/lois' => 'lois#index'
      post '/lois/' => 'lois#create'
      get '/lois/:id' => 'lois#show'
      patch '/lois/:id' => 'lois#update'

      get '/questions' => 'questions#index'
      get '/questions/:id' => 'questions#show'

      get '/sections' => 'sections#index'
      post '/answers' => 'answers#create'
      get '/answers' => 'answers#index'
      get '/ratings' => 'ratings#index'
      get '/ratings/:id' => 'ratings#show'
      patch 'ratings/:id' => 'ratings#update'
      
    end
  end

  get '/home' => 'landings#home'
  get '/thanks/:id' => 'landings#thanks'


  get 'ratings/index'

  get 'ratings/show'

  get '/landings' => 'landings#index'


  get '/ratings' => 'ratings#index'
  get '/ratings/new' => 'ratings#new'
  get '/ratings/:id' => 'ratings#show'
  post '/ratings' => 'ratings#create'
  get '/ratings/:id/edit' => 'ratings#edit'
  patch '/ratings/:id' => 'ratings#update'
  delete '/ratings/:id' => 'ratings#destroy'

  get '/questions' => 'questions#index'
  get '/questions/new' => 'questions#new'
  post '/questions' => 'questions#create'
  get '/questions/:id' => 'questions#show'
  get '/questions/:id/edit' => 'questions#edit'
  patch '/questions/:id' => 'questions#update'
  delete '/questions/:id' => 'questions#destroy'

  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  patch '/users/:id' => 'users#update'

  get '/lois' => 'lois#index'
  get '/lois/new' => 'lois#new'
  post '/lois' => 'lois#create'
  get '/lois/:id' => 'lois#show'
  get '/lois/:id/edit' => 'lois#edit'
  patch '/lois/:id' => 'lois#update'
  delete '/lois/:id' => 'lois#destroy'

  get '/sections' => 'sections#index'
  get '/sections' => 'sections#new'
  get '/sections/:id' => 'sections#show'
  post '/sections' => 'sections#create'
 
  get '/rfps/new' => 'rfps#new'

  get '/rfp_questions' => 'rfp_questions#index'
  get '/rfp_questions/new' => 'rfp_questions#new'
  post '/rfp_questions' => 'rfp_questions#create'
  get '/rfp_questions/:id' => 'rfp_questions#show'
  get '/rfp_questions/:id/edit' => 'rfp_questions#edit'
  patch '/rfp_questions/:id' => 'rfp_questions#update'
  delete '/rfp_questions/:id' => 'rfp_questions#destroy'

end
