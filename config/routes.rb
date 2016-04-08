Rails.application.routes.draw do

  get '/ratings' => 'ratings#index'

  get '/ratings/:id' => 'ratings#show'

  get '/ratings/new' => 'ratings#new'

  get '/ratings/:id' => 'ratings#edit'

  get '/landings' => 'landings#index'

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

  
end
