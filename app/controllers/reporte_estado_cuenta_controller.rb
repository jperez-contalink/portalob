class ReporteEstadoCuentaController < ApplicationController
  before_action :set_reporte_estado_cuentum, only: [:show, :edit, :update, :destroy]

  # GET /reporte_estado_cuenta
  # GET /reporte_estado_cuenta.json
  def index
    puts carlos
    @reporte_estado_cuenta = ReporteEstadoCuentum.all
    respond_to do |format|
      format.json {render json: @reporte_estado_cuenta}
    end    
  end

  # GET /reporte_estado_cuenta/1
  # GET /reporte_estado_cuenta/1.json
  def show
  end

  # GET /reporte_estado_cuenta/new
  def new
    @reporte_estado_cuentum = ReporteEstadoCuentum.new
  end

  # GET /reporte_estado_cuenta/1/edit
  def edit
  end

  # POST /reporte_estado_cuenta
  # POST /reporte_estado_cuenta.json
  def create
    @reporte_estado_cuentum = ReporteEstadoCuentum.new(reporte_estado_cuentum_params)

    respond_to do |format|
      if @reporte_estado_cuentum.save
        format.html { redirect_to @reporte_estado_cuentum, notice: 'Reporte estado cuentum was successfully created.' }
        format.json { render :show, status: :created, location: @reporte_estado_cuentum }
      else
        format.html { render :new }
        format.json { render json: @reporte_estado_cuentum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reporte_estado_cuenta/1
  # PATCH/PUT /reporte_estado_cuenta/1.json
  def update
    respond_to do |format|
      if @reporte_estado_cuentum.update(reporte_estado_cuentum_params)
        format.html { redirect_to @reporte_estado_cuentum, notice: 'Reporte estado cuentum was successfully updated.' }
        format.json { render :show, status: :ok, location: @reporte_estado_cuentum }
      else
        format.html { render :edit }
        format.json { render json: @reporte_estado_cuentum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reporte_estado_cuenta/1
  # DELETE /reporte_estado_cuenta/1.json
  def destroy
    @reporte_estado_cuentum.destroy
    respond_to do |format|
      format.html { redirect_to reporte_estado_cuenta_url, notice: 'Reporte estado cuentum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reporte_estado_cuentum
      @reporte_estado_cuentum = ReporteEstadoCuentum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reporte_estado_cuentum_params
      params[:reporte_estado_cuentum]
    end
end
