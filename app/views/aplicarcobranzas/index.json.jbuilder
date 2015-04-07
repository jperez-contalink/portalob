json.array!(@aplicarcobranzas) do |aplicarcobranza|
  json.extract! aplicarcobranza, :id
  json.url aplicarcobranza_url(aplicarcobranza, format: :json)
end
