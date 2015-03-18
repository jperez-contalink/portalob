json.array!(@pedidolineas) do |pedidolinea|
  json.extract! pedidolinea, :id, :pedido_id, :producto, :product_value, :product_id, :precio, :cantidad, :total, :imagen
  json.url pedidolinea_url(pedidolinea, format: :json)
end
