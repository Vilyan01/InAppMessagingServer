Rails.application.routes.draw do
  root 'welcome#index'
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      # API Endpoints
      # CHECK CONVERSATION EXISTANCE
      get 'conversation' => 'conversation#exists'
      # GET CONVERSATION
      get 'conversation/:id' => 'conversation#show'
      # CREATE CONVERSATION
      post 'conversation' => 'conversation#create'
      # CREATE MESSAGE
      post 'conversation/:conversation_id' => 'message#create'
      # GET MESSAGE
      get 'message/:id' => 'message#show'
      # GET CONVERSATION MESSAGES
      get 'conversation/:conversation_id/messages' => 'conversation#messages'
    end
  end
end
