json.extract! entry, :id, :title, :media_type, :rating, :body, :created_at, :updated_at
json.url entry_url(entry, format: :json)
