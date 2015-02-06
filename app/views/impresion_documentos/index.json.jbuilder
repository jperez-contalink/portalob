json.array!(@impresion_documentos) do |impresion_documento|
  json.extract! impresion_documento, :id
  json.url impresion_documento_url(impresion_documento, format: :json)
end
