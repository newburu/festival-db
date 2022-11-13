json.extract! content, :id, :name, :kind, :path, :detail, :created_at, :updated_at
json.url content_url(content, format: :json)
