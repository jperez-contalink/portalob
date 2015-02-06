class ImpresionDocumentosController < ApplicationController
  before_action :set_impresion_documento, only: [:show, :edit, :update, :destroy]

  def index
    @impresion_documentos = ImpresionDocumento.all
    #send_data(impresion_documentos, :type => 'application/zip', :filename => "koalas",:layout => true)
  end

  # GET /impresion_documentos/1
  # GET /impresion_documentos/1.json
  def show
  end

  # GET /impresion_documentos/new
  def new
    @impresion_documento = ImpresionDocumento.new
  end

  # GET /impresion_documentos/1/edit
  def edit
  end

  # POST /impresion_documentos
  # POST /impresion_documentos.json
  def create
    @impresion_documento = ImpresionDocumento.new(impresion_documento_params)

    respond_to do |format|
      if @impresion_documento.save
        format.html { redirect_to @impresion_documento, notice: 'Impresion documento was successfully created.' }
        format.json { render :show, status: :created, location: @impresion_documento }
      else
        format.html { render :new }
        format.json { render json: @impresion_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /impresion_documentos/1
  # PATCH/PUT /impresion_documentos/1.json
  def update
    respond_to do |format|
      if @impresion_documento.update(impresion_documento_params)
        format.html { redirect_to @impresion_documento, notice: 'Impresion documento was successfully updated.' }
        format.json { render :show, status: :ok, location: @impresion_documento }
      else
        format.html { render :edit }
        format.json { render json: @impresion_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /impresion_documentos/1
  # DELETE /impresion_documentos/1.json
  def destroy
    @impresion_documento.destroy
    respond_to do |format|
      format.html { redirect_to impresion_documentos_url, notice: 'Impresion documento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_impresion_documento
      @impresion_documento = ImpresionDocumento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def impresion_documento_params
      params[:impresion_documento]
    end
end
