class DescargaImagenesController < ApplicationController
  before_action :set_descarga_imagen, only: [:show, :edit, :update, :destroy]

  def index
    @descarga_imagenes = DescargaImagen.all
    #send_data(descarga_imagenes, :type => 'application/zip', :filename => "koalas",:layout => true)
  end

  # GET /descarga_imagenes/1
  # GET /descarga_imagenes/1.json
  def show
  end

  # GET /descarga_imagenes/new
  def new
    @descarga_imagen = DescargaImagen.new
  end

  # GET /descarga_imagenes/1/edit
  def edit
  end

  # POST /descarga_imagenes
  # POST /descarga_imagenes.json
  def create
    @descarga_imagen = DescargaImagen.new(descarga_imagen_params)

    respond_to do |format|
      if @descarga_imagen.save
        format.html { redirect_to @descarga_imagen, notice: 'Descarga imagen was successfully created.' }
        format.json { render :show, status: :created, location: @descarga_imagen }
      else
        format.html { render :new }
        format.json { render json: @descarga_imagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /descarga_imagenes/1
  # PATCH/PUT /descarga_imagenes/1.json
  def update
    respond_to do |format|
      if @descarga_imagen.update(descarga_imagen_params)
        format.html { redirect_to @descarga_imagen, notice: 'Descarga imagen was successfully updated.' }
        format.json { render :show, status: :ok, location: @descarga_imagen }
      else
        format.html { render :edit }
        format.json { render json: @descarga_imagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descarga_imagenes/1
  # DELETE /descarga_imagenes/1.json
  def destroy
    @descarga_imagen.destroy
    respond_to do |format|
      format.html { redirect_to descarga_imagenes_url, notice: 'Descarga imagen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_descarga_imagen
      @descarga_imagen = DescargaImagen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def descarga_imagen_params
      params[:descarga_imagen]
    end
end
