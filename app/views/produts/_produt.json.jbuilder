json.extract! produt, :id, :name, :description, :image_url, :created_at, :updated_at
json.url produt_url(produt, format: :json)
