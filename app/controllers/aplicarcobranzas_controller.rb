class AplicarcobranzasController < ApplicationController
  before_action :set_aplicarcobranza, only: [:show, :edit, :update, :destroy]

  # GET /aplicarcobranzas
  # GET /aplicarcobranzas.json
  def index
    @aplicarcobranzas = Aplicarcobranza.all
  end

  # GET /aplicarcobranzas/1
  # GET /aplicarcobranzas/1.json
  def show
  end

  # GET /aplicarcobranzas/new
  def new
    @aplicarcobranza = Aplicarcobranza.new
  end

  # GET /aplicarcobranzas/1/edit
  def edit
  end

  # POST /aplicarcobranzas
  # POST /aplicarcobranzas.json
  def create
    @aplicarcobranza = Aplicarcobranza.new(aplicarcobranza_params)

    respond_to do |format|
      if @aplicarcobranza.save
        format.html { redirect_to @aplicarcobranza, notice: 'Aplicarcobranza was successfully created.' }
        format.json { render :show, status: :created, location: @aplicarcobranza }
      else
        format.html { render :new }
        format.json { render json: @aplicarcobranza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aplicarcobranzas/1
  # PATCH/PUT /aplicarcobranzas/1.json
  def update
    respond_to do |format|
      if @aplicarcobranza.update(aplicarcobranza_params)
        format.html { redirect_to @aplicarcobranza, notice: 'Aplicarcobranza was successfully updated.' }
        format.json { render :show, status: :ok, location: @aplicarcobranza }
      else
        format.html { render :edit }
        format.json { render json: @aplicarcobranza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aplicarcobranzas/1
  # DELETE /aplicarcobranzas/1.json
  def destroy
    @aplicarcobranza.destroy
    respond_to do |format|
      format.html { redirect_to aplicarcobranzas_url, notice: 'Aplicarcobranza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aplicarcobranza
      @aplicarcobranza = Aplicarcobranza.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aplicarcobranza_params
      params[:aplicarcobranza]
    end
end
