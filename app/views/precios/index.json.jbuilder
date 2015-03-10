json.array!(@precios) do |precio|
  json.extract! precio, :id
  json.url precio_url(precio, format: :json)
end
