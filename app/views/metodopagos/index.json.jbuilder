json.array!(@metodopagos) do |metodopago|
  json.extract! metodopago, :id
  json.url metodopago_url(metodopago, format: :json)
end
