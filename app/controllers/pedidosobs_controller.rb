class PedidosobsController < ApplicationController
  before_action :set_pedidosob, only: [:show, :edit, :update, :destroy]

  # GET /pedidosobs
  # GET /pedidosobs.json
  def index
    @pedidosobs = Pedidosob.all
  end

  # GET /pedidosobs/1
  # GET /pedidosobs/1.json
  def show
  end

  # GET /pedidosobs/new
  def new
    @pedidosob = Pedidosob.new
  end

  # GET /pedidosobs/1/edit
  def edit
  end

  # POST /pedidosobs
  # POST /pedidosobs.json
  def create
    @pedidosob = Pedidosob.new(pedidosob_params)

    respond_to do |format|
      if @pedidosob.save
        format.html { redirect_to @pedidosob, notice: 'Pedidosob was successfully created.' }
        format.json { render :show, status: :created, location: @pedidosob }
      else
        format.html { render :new }
        format.json { render json: @pedidosob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidosobs/1
  # PATCH/PUT /pedidosobs/1.json
  def update
    respond_to do |format|
      if @pedidosob.update(pedidosob_params)
        format.html { redirect_to @pedidosob, notice: 'Pedidosob was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedidosob }
      else
        format.html { render :edit }
        format.json { render json: @pedidosob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidosobs/1
  # DELETE /pedidosobs/1.json
  def destroy
    @pedidosob.destroy
    respond_to do |format|
      format.html { redirect_to pedidosobs_url, notice: 'Pedidosob was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedidosob
      @pedidosob = Pedidosob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedidosob_params
      params[:pedidosob]
    end
end
