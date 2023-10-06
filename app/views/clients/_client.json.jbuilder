json.extract! client, :id, :name, :phone, :time, :note, :created_at, :updated_at
json.url client_url(client, format: :json)
