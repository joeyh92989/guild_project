Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'messages', to: 'messages#index'
      get 'messages/:id', to: 'messages#conversation_history'
      post 'messages/:id', to: 'messages#create'
    end
  end
end
