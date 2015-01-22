json.array!(@empresas) do |empresa|
  json.extract! empresa, :id, :dns, :rfc, :urlwebservice, :usuariosob, :passob
  json.url empresa_url(empresa, format: :json)
end
