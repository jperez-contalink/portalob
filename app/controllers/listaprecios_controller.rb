class ListapreciosController < ApplicationController
  before_action :set_listaprecio, only: [:show, :edit, :update, :destroy]

  # GET /listaprecios
  # GET /listaprecios.json


    def index
    @listaprecios = Listaprecio.all
    respond_to do |format|
      format.json {render json: @listaprecio}
    end    
  end

  # GET /listaprecios/1
  # GET /listaprecios/1.json
  def show
  end

  # GET /listaprecios/new
  def new
    @listaprecio = Listaprecio.new
  end

  # GET /listaprecios/1/edit
  def edit
  end

  # POST /listaprecios
  # POST /listaprecios.json
  def create
    @listaprecio = Listaprecio.new(listaprecio_params)

    respond_to do |format|
      if @listaprecio.save
        format.html { redirect_to @listaprecio, notice: 'Listaprecio was successfully created.' }
        format.json { render :show, status: :created, location: @listaprecio }
      else
        format.html { render :new }
        format.json { render json: @listaprecio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listaprecios/1
  # PATCH/PUT /listaprecios/1.json
  def update
    respond_to do |format|
      if @listaprecio.update(listaprecio_params)
        format.html { redirect_to @listaprecio, notice: 'Listaprecio was successfully updated.' }
        format.json { render :show, status: :ok, location: @listaprecio }
      else
        format.html { render :edit }
        format.json { render json: @listaprecio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listaprecios/1
  # DELETE /listaprecios/1.json
  def destroy
    @listaprecio.destroy
    respond_to do |format|
      format.html { redirect_to listaprecios_url, notice: 'Listaprecio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listaprecio
      @listaprecio = Listaprecio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listaprecio_params
      params[:listaprecio]
    end
end
