Rails.application.routes.draw do
  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unprocessable_entity'
  get '/500', to: 'errors#internal_server_error'

  root 'pages#home'

  resources :users do
    member do
      get :view_my_following
      get :view_my_followers
    end

    collection do
      post :follow_user
    end
  end
end
