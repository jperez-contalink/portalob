json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :usuario_id, :total, :subtotal, :abierto, :activo
  json.url pedido_url(pedido, format: :json)
end
