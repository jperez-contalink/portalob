class PedidolineasController < ApplicationController
  before_action :set_pedidolinea, only: [:show, :edit, :update, :destroy]

  # GET /pedidolineas
  # GET /pedidolineas.json
  def index
    puts "CREA LINEA: usr:" + params[:usuario_id]
    # Buscar el pedido activo para el usuario
    Pedido.where(usuario_id: params[:usuario_id]).find_each do |ords|
      if ords.activo?
        @ord = ords
      end
    end
    # Si no se encontró una orden crear  una y asignarla a @ord:
    if @ord.nil?
      @ord = Pedido.create!({:usuario_id => params[:usuario_id], :total => 0, :subtotal => 0, :abierto => true, :activo => true})
    end
    # Crear la linea en el pedido activo
    puts "CREAR LINEA"
    # El precio ya incluye impuesto por es no se considera.
    total = params[:cantidad].to_f*params[:precio].to_f
    # params[:impuesto]
    #Pedidolinea.create!({:pedido_id => @ord.id, :producto => params[:producto], :product_value => params[:product_value], :precio => params[:precio], :total => total, :cantidad => params[:cantidad], :product_id => params[:producto_id], :imagen => params[:imagenurl], :maximo => params[:invmax].to_f})
    Pedidolinea.create!({:pedido_id => @ord.id, :producto => params[:producto], :product_value => params[:product_value], :precio => params[:precio], :total => total, :cantidad => params[:cantidad], :product_id => params[:producto_id], :imagen => params[:imagenurl], :maximo => params[:invmax].to_f, :impuesto => params[:impuesto].to_f, :precioob => params[:precioob].to_f, :precioproductoextra => params[:precioproductoextra].to_f, :productoextra => params[:productoextra], :impuestoextra => params[:impuestoproductoextra], :adimageid => params[:adimageid]})
    @pedidolineas = Pedidolinea.all
  end

  # GET /pedidolineas/1
  # GET /pedidolineas/1.json
  def show
  end

  # GET /pedidolineas/new
  def new
    @pedidolinea = Pedidolinea.new
  end

  # GET /pedidolineas/1/edit
  def edit
  end

  # POST /pedidolineas
  # POST /pedidolineas.json
  def create
    @pedidolinea = Pedidolinea.new(pedidolinea_params)

    respond_to do |format|
      if @pedidolinea.save
        format.html { redirect_to @pedidolinea, notice: 'Pedidolinea was successfully created.' }
        format.json { render :show, status: :created, location: @pedidolinea }
      else
        format.html { render :new }
        format.json { render json: @pedidolinea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidolineas/1
  # PATCH/PUT /pedidolineas/1.json
  def update
    respond_to do |format|
      if @pedidolinea.update(pedidolinea_params)
        format.html { redirect_to @pedidolinea, notice: 'Pedidolinea was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedidolinea }
      else
        format.html { render :edit }
        format.json { render json: @pedidolinea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidolineas/1
  # DELETE /pedidolineas/1.json
  def destroy
    @pedidolinea.destroy
    respond_to do |format|
      format.html { redirect_to pedidolineas_url, notice: 'Pedidolinea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedidolinea
      @pedidolinea = Pedidolinea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedidolinea_params
      params.require(:pedidolinea).permit(:pedido_id, :producto, :product_value, :product_id, :precio, :cantidad, :total, :imagen)
    end
end
