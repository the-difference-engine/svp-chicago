Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do

      root 'users#show', as: :authenticated_root
    end

  unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  namespace :api do
    namespace :v1 do
      get '/lois' => 'lois#index'
      post '/lois/' => 'lois#create'
      get '/lois/:id' => 'lois#show'
      patch '/lois/:id' => 'lois#update'

      get '/invited_lois' => 'invited_lois#index'
      post '/invited_lois/' => 'invited_lois#create'
      get '/invited_lois/:id' => 'invited_lois#show'

      get '/invite_maxes' => 'invite_maxes#index'
      get '/invite_maxes/:id' => 'invite_maxes#show'


      get '/questions' => 'questions#index'
      get '/questions/:id' => 'questions#show'

      get '/sections' => 'sections#index'
      post '/answers' => 'answers#create'
      get '/answers' => 'answers#index'
      get '/ratings' => 'ratings#index'
      get '/ratings/yes_ratings' => 'ratings#yes_ratings'
      get '/ratings/:id' => 'ratings#show'
      patch 'ratings/:id.json' => 'ratings#update'

      get '/rfp_sections' => 'rfp_sections#index'
      post '/rfp_sections' => 'rfp_sections#create'
      patch '/rfp_sections/:id.json' => 'rfp_sections#update'

      get '/rfps' => 'rfps#index'
      get '/rfps/:id' => 'rfps#show'
      patch '/rfps/:id' => 'rfps#update'

      get '/rfp_questions' => 'rfp_questions#index'

      get '/rfp_ratings' => 'rfp_ratings#index'

      post '/attachments' => 'attachments#create'

      delete '/rfp_answers' => 'rfp_answers#destroy'

      delete '/sub_answers' => 'sub_answers#destroy'
    end
  end

  get '/home' => 'landings#home'
  get '/thanks/:id' => 'landings#thanks'

  get '/landings' => 'landings#index'
  get '/landings/edit' => 'landings#edit'
  get '/landings/:id' => 'landings#home'
  patch '/landings/:id' => 'landings#update'

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

  get '/rfps' => 'rfps#index'
  get '/rfps/new' => 'rfps#new'
  get '/rfps/:id' => 'rfps#show'
  get '/rfps/:id/edit' => 'rfps#edit'
  patch '/rfps/:id' => 'rfps#update'

  get '/rfp_ratings' => 'rfp_ratings#index'
  get '/rfp_ratings/new' => 'rfp_ratings#new'
  get '/rfp_ratings/:id' => 'rfp_ratings#show'
  post '/rfp_ratings' => 'rfp_ratings#create'
  get '/rfp_ratings/:id/edit' => 'rfp_ratings#edit'
  patch '/rfp_ratings/:id' => 'rfp_ratings#update'
  delete '/rfp_ratings/:id' => 'rfp_ratings#destroy'

  get '/rfp_questions' => 'rfp_questions#index'
  get '/rfp_questions/new' => 'rfp_questions#new'
  post '/rfp_questions' => 'rfp_questions#create'
  get '/rfp_questions/:id' => 'rfp_questions#show'
  get '/rfp_questions/:id/edit' => 'rfp_questions#edit'
  patch '/rfp_questions/:id' => 'rfp_questions#update'
  delete '/rfp_questions/:id' => 'rfp_questions#destroy'

  get '/attachments' => 'attachments#index'
  get '/attachments/new' => 'attachments#new'
  post '/attachments' => 'attachments#create'
  get '/attachments/:id' => 'attachments#show'

  get 'invite_maxes/:id/edit' => 'invite_maxes#edit'
  patch 'invite_maxes/:id' => 'invite_maxes#update'

  get '/rfp_sections/new' => 'rfp_sections#new'
  post '/rfp_sections' => 'rfp_sections#create'
  get '/rfp_sections/:id/edit' => 'rfp_sections#edit'
  patch '/rfp_sections/:id' => 'rfp_sections#update'
  delete '/rfp_sections/:id' => 'rfp_sections#destroy'

  get '/sub_questions/:id/edit' => 'sub_questions#edit'
  patch '/sub_questions/:id' => 'sub_questions#update'
  delete '/sub_questions/:id' => 'sub_questions#destroy'

  get '/emails' => 'emails#index'
  post '/emails' => 'emails#send_rejection_emails'

end
