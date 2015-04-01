class DocumentoscobranzasController < ApplicationController
  before_action :set_documentoscobranza, only: [:show, :edit, :update, :destroy]

  # GET /documentoscobranzas
  # GET /documentoscobranzas.json
  def index
    @documentoscobranzas = Documentoscobranza.all
  end

  # GET /documentoscobranzas/1
  # GET /documentoscobranzas/1.json
  def show
  end

  # GET /documentoscobranzas/new
  def new
    @documentoscobranza = Documentoscobranza.new
  end

  # GET /documentoscobranzas/1/edit
  def edit
  end

  # POST /documentoscobranzas
  # POST /documentoscobranzas.json
  def create
    @documentoscobranza = Documentoscobranza.new(documentoscobranza_params)

    respond_to do |format|
      if @documentoscobranza.save
        format.html { redirect_to @documentoscobranza, notice: 'Documentoscobranza was successfully created.' }
        format.json { render :show, status: :created, location: @documentoscobranza }
      else
        format.html { render :new }
        format.json { render json: @documentoscobranza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documentoscobranzas/1
  # PATCH/PUT /documentoscobranzas/1.json
  def update
    respond_to do |format|
      if @documentoscobranza.update(documentoscobranza_params)
        format.html { redirect_to @documentoscobranza, notice: 'Documentoscobranza was successfully updated.' }
        format.json { render :show, status: :ok, location: @documentoscobranza }
      else
        format.html { render :edit }
        format.json { render json: @documentoscobranza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentoscobranzas/1
  # DELETE /documentoscobranzas/1.json
  def destroy
    @documentoscobranza.destroy
    respond_to do |format|
      format.html { redirect_to documentoscobranzas_url, notice: 'Documentoscobranza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documentoscobranza
      @documentoscobranza = Documentoscobranza.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def documentoscobranza_params
      params[:documentoscobranza]
    end
end
