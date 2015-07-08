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
  resources :listprices
  resources :reservations
  
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
  #post "registro" => "pages#registro"
  get "success" => "pages#success"
  post "carrito" => "pages#carrito"
  get "success_order" => "pages#success_order"
  get "cambia_linea" => "pages#cambia_linea"
  get "valida_linea" => "pages#valida_linea"
  get "registro_nuevo" => "pages#registro_nuevo"
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
      resources :reporte_facturas, only: [:index]
      resources :documentoscobranzas, only: [:index]
      resources :pedidosobs, only: [:index]
      resources :metodopagos, only: [:index]
      resources :posproductos, only: [:index]
      resources :posprecios, only: [:index]
      resources :poslotes, only: [:index]
      resources :pedidonuevos, only: [:index]
      resources :borrarlineas, only: [:index]
      resources :customers, only: [:index]
      resources :reporte_estado_cuenta, only: [:index]
      resources :impresion_documentos, only: [:index]
      resources :descarga_imagenes, only: [:index]
      resources :precios, only: [:index]
      resources :productos, only: [:index]
      resources :listaprecios, only: [:index]
      resources :aplicarcobranzas, only: [:index]
      resources :ad_images, only: [:show]
      resources :listprices, only: [:index]
      resources :reservations, only: [:index]
    end  
  end
  namespace :api, defaults: {format: 'html'} do
    namespace :v1 do
      resources :escribepedidos, only: [:index]
    end
  end

end
