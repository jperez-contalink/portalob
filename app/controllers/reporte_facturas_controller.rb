class ReporteFacturasController < ApplicationController
  before_action :set_reportefactura, only: [:show, :edit, :update, :destroy]

  # GET /reportefacturas
  # GET /reportefacturas.json
  def index
    puts carlos
    @reportefacturas = Reportefactura.all
    respond_to do |format|
      format.json {render json: @reportefacturas}
    end
  end

  # GET /reportefacturas/1
  # GET /reportefacturas/1.json
  def show
  end

  # GET /reportefacturas/new
  def new
    @reportefactura = Reportefactura.new
  end

  # GET /reportefacturas/1/edit
  def edit
  end

  # POST /reportefacturas
  # POST /reportefacturas.json
  def create
    @reportefactura = Reportefactura.new(reportefactura_params)

    respond_to do |format|
      if @reportefactura.save
        format.html { redirect_to @reportefactura, notice: 'Reportefactura was successfully created.' }
        format.json { render :show, status: :created, location: @reportefactura }
      else
        format.html { render :new }
        format.json { render json: @reportefactura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reportefacturas/1
  # PATCH/PUT /reportefacturas/1.json
  def update
    respond_to do |format|
      if @reportefactura.update(reportefactura_params)
        format.html { redirect_to @reportefactura, notice: 'Reportefactura was successfully updated.' }
        format.json { render :show, status: :ok, location: @reportefactura }
      else
        format.html { render :edit }
        format.json { render json: @reportefactura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reportefacturas/1
  # DELETE /reportefacturas/1.json
  def destroy
    @reportefactura.destroy
    respond_to do |format|
      format.html { redirect_to reportefacturas_url, notice: 'Reportefactura was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reportefactura
      @reportefactura = Reportefactura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reportefactura_params
      params[:reportefactura]
    end
end
