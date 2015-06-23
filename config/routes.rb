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

  devise_for :usuarios do
    get "/usuarios/sign_out" => "devise/sessions#destroy", :as => :destroy_usuario_session_path
    get "/usuarios/sign_in" => "devise/sessions#new", :as => :new_usuario_session
  end

  #match 'photos', to: 'photos#show', via: [:get, :post]

  resources :reporte_estado_cuenta

  resources :reporte_facturas


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
    end  
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :documentoscobranzas
    end  
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :pedidosobs
    end  
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :metodopagos
    end  
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :posproductos
    end  
  end
  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :usuarios
    end  
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :posprecios
    end  
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :poslotes
    end  
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :pedidonuevos
    end  
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :borrarlineas
    end  
  end  

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :customers
    end  
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :reporte_estado_cuenta
    end  
  end

  namespace :api, defaults: {format: 'xml'} do
    namespace :v1 do
      resources :impresion_documentos
    end  
  end

  namespace :api, defaults: {format: 'xml'} do
    namespace :v1 do
      resources :descarga_imagenes
    end  
  end  

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :precios
    end  
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :productos
    end  
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :listaprecios
    end  
  end  

  namespace :api, defaults: {format: 'xml'} do
    namespace :v1 do
      resources :escribepedidos
    end  
  end

  namespace :api, defaults: {format: 'xml'} do
    namespace :v1 do
      resources :aplicarcobranzas
    end  
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
