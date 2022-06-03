json.extract! chat, :id, :number, :message_count, :created_at, :updated_at
json.url chat_url(chat, format: :json)
