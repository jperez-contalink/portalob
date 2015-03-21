class EscribepedidosController < ApplicationController
  before_action :set_escribepedido, only: [:show, :edit, :update, :destroy]

  # GET /escribepedidos
  # GET /escribepedidos.json
  def index
    @escribepedidos = Escribepedido.all
  end

  # GET /escribepedidos/1
  # GET /escribepedidos/1.json
  def show
  end

  # GET /escribepedidos/new
  def new
    @escribepedido = Escribepedido.new
  end

  # GET /escribepedidos/1/edit
  def edit
  end

  # POST /escribepedidos
  # POST /escribepedidos.json
  def create
    @escribepedido = Escribepedido.new(escribepedido_params)

    respond_to do |format|
      if @escribepedido.save
        format.html { redirect_to @escribepedido, notice: 'Escribepedido was successfully created.' }
        format.json { render :show, status: :created, location: @escribepedido }
      else
        format.html { render :new }
        format.json { render json: @escribepedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escribepedidos/1
  # PATCH/PUT /escribepedidos/1.json
  def update
    respond_to do |format|
      if @escribepedido.update(escribepedido_params)
        format.html { redirect_to @escribepedido, notice: 'Escribepedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @escribepedido }
      else
        format.html { render :edit }
        format.json { render json: @escribepedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escribepedidos/1
  # DELETE /escribepedidos/1.json
  def destroy
    @escribepedido.destroy
    respond_to do |format|
      format.html { redirect_to escribepedidos_url, notice: 'Escribepedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escribepedido
      @escribepedido = Escribepedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def escribepedido_params
      params[:escribepedido]
    end
end
