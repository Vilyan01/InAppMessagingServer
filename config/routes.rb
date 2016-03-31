Rails.application.routes.draw do
  root 'welcome#index'
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'conversation/:id' => 'conversation#index'
      # API Endpoints
      # CREATE MESSAGE
      # CREATE CONVERSATION
    end
  end
end
