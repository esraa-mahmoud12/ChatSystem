Rails.application.routes.draw do
 
  resources :applications do
    resources :chats do
      resources :messages
    end
  end
  

  resources :applications 
  resources :chats 
  resources :messages
  
 


  root "applications#index"
  get "/applications/:application_id/chats/:chat_id/messages/search", to: "messages#search_messages"
end