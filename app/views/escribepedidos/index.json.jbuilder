json.array!(@escribepedidos) do |escribepedido|
  json.extract! escribepedido, :id
  json.url escribepedido_url(escribepedido, format: :json)
end
