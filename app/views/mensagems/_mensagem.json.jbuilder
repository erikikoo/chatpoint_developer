json.extract! mensagem, :id, :user_id, :content, :all, :created_at, :updated_at
json.url mensagem_url(mensagem, format: :json)