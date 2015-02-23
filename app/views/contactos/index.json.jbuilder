json.array!(@contactos) do |contacto|
  json.extract! contacto, :id, :titulo, :correo, :usuario_id
  json.url contacto_url(contacto, format: :json)
end
