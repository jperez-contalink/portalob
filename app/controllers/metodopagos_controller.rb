class MetodopagosController < ApplicationController
  before_action :set_metodopago, only: [:show, :edit, :update, :destroy]

  # GET /metodopagos
  # GET /metodopagos.json
  def index
    @metodopagos = Metodopago.all
  end

  # GET /metodopagos/1
  # GET /metodopagos/1.json
  def show
  end

  # GET /metodopagos/new
  def new
    @metodopago = Metodopago.new
  end

  # GET /metodopagos/1/edit
  def edit
  end

  # POST /metodopagos
  # POST /metodopagos.json
  def create
    @metodopago = Metodopago.new(metodopago_params)

    respond_to do |format|
      if @metodopago.save
        format.html { redirect_to @metodopago, notice: 'Metodopago was successfully created.' }
        format.json { render :show, status: :created, location: @metodopago }
      else
        format.html { render :new }
        format.json { render json: @metodopago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metodopagos/1
  # PATCH/PUT /metodopagos/1.json
  def update
    respond_to do |format|
      if @metodopago.update(metodopago_params)
        format.html { redirect_to @metodopago, notice: 'Metodopago was successfully updated.' }
        format.json { render :show, status: :ok, location: @metodopago }
      else
        format.html { render :edit }
        format.json { render json: @metodopago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metodopagos/1
  # DELETE /metodopagos/1.json
  def destroy
    @metodopago.destroy
    respond_to do |format|
      format.html { redirect_to metodopagos_url, notice: 'Metodopago was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metodopago
      @metodopago = Metodopago.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metodopago_params
      params[:metodopago]
    end
end
