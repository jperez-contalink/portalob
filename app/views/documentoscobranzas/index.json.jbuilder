json.array!(@documentoscobranzas) do |documentoscobranza|
  json.extract! documentoscobranza, :id
  json.url documentoscobranza_url(documentoscobranza, format: :json)
end
