json.array!(@listaprecios) do |listaprecio|
  json.extract! listaprecio, :id
  json.url listaprecio_url(listaprecio, format: :json)
end
