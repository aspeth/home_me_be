Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/shelters', to: 'shelters#index'
    end
  end

  #used for testing return values as a feature before serializer was implemented
  get '/', to: 'welcome#index'
  get '/results', to: 'results#all_shelters'
end
