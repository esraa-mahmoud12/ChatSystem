Rails.application.routes.draw do
  resources :messages
  resources :chats
  resources :applications
  
  
  root "applications#index"
  get "/applications/:application_id/chats/:chat_id/messages/search", to: "messages#search_messages"
end
