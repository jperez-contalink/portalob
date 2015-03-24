json.array!(@pedidosobs) do |pedidosob|
  json.extract! pedidosob, :id
  json.url pedidosob_url(pedidosob, format: :json)
end
