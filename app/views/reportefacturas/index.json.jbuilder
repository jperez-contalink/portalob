json.array!(@reportefacturas) do |reportefactura|
  json.extract! reportefactura, :id
  json.url reportefactura_url(reportefactura, format: :json)
end
