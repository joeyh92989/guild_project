Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/messages/:id', to: 'messages#create'
      get 'messages/:id', to: 'messages#conversation_history'
    end
  end
end
