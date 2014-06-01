json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :image_url, :available, :price_in_cents
  json.url product_url(product, format: :json)
end
