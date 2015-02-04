json.array!(@reporte_estado_cuenta) do |reporte_estado_cuentum|
  json.extract! reporte_estado_cuentum, :id
  json.url reporte_estado_cuentum_url(reporte_estado_cuentum, format: :json)
end
