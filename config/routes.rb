require 'api_constraints'
Rails.application.routes.draw do
 
  resources :metodopagos
  resources :aplicarcobranzas
  resources :documentoscobranzas
  resources :pedidosobs
  resources :escribepedidos
  resources :pedidolineas
  resources :pedidos
  resources :precios
  resources :listaprecios
  resources :productos
  resources :contactos
  resources :impresion_documentos
  resources :descarga_imagenes
  resources :empresas
  resources :reporte_estado_cuenta
  resources :reporte_facturas
  
  devise_for :usuarios do
    get "/usuarios/sign_out" => "devise/sessions#destroy", 
      :as => :destroy_usuario_session_path
    get "/usuarios/sign_in" => "devise/sessions#new", 
      :as => :new_usuario_session
  end
  root :to => 'pages#home'
  get "test" => "pages#test"
  get "facturas" => "pages#facturas"
  get "estadosdecuenta" => "pages#estadosdecuenta"
  get "contacto" => "pages#contacto"
  get "catalogoproductos" => "pages#catalogoproductos"
  get "carrito" => "pages#carrito"
  get "registro" => "pages#registro"
  post "registro" => "pages#registro"
  get "success" => "pages#success"
  post "carrito" => "pages#carrito"
  get "success_order" => "pages#success_order"
  get "cambia_linea" => "pages#cambia_linea"
  get "customer_selected" => "pages#customer_selected"
  get "borrar_linea" => "pages#borrar_linea"
  get "cobranza" => "pages#cobranza"
  get "unauthorized" => "pages#unauthorized"
  get "imagenes" => "pages#importar_imagenes"
  get "clientes" => "pages#clientes"
  get "listadeproductos" => "pages#lista_productos"
  get "puntodeventa" => "pages#pos"
 
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :reporte_facturas
      resources :documentoscobranzas
      resources :pedidosobs
      resources :metodopagos
      resources :posproductos
      resources :posprecios
      resources :poslotes
      resources :pedidonuevos
      resources :borrarlineas
      resources :customers
      resources :reporte_estado_cuenta
      resources :impresion_documentos
      resources :descarga_imagenes
      resources :precios
      resources :productos
      resources :listaprecios
      resources :escribepedidos
      resources :aplicarcobranzas
    end  
  end
end