Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/shelters', to: 'shelters#index'
      get '/shelters/:id', to: 'shelters#show'
      get '/directions', to: 'directions#index'
      get '/users/:id/shelters', to: 'user_shelters#index'
      post '/user_shelters', to: 'user_shelters#create'
      delete '/users/:user_id/shelters/:shelter_id', to: 'user_shelters#destroy'
    end
  end

  #used for testing return values as a feature before serializer was implemented
  get '/', to: 'welcome#index'
  get '/results', to: 'results#all_shelters'
end
