class PontuationsController < ApplicationController
  before_action :set_pontuation, only: [:show, :edit, :update, :destroy]

  # GET /pontuations
  # GET /pontuations.json

  def index
    @pontuations = Pontuation.all
    @pontuacoes = ApplicationRecord.conexao_banco()
  end

  # GET /pontuations/1
  # GET /pontuations/1.json
  def show
  end

  # GET /pontuations/new
  def new
    @pontuation = Pontuation.new
  end

  # GET /pontuations/1/edit
  def edit
  end

  # POST /pontuations
  # POST /pontuations.json
  def create
    @pontuation = Pontuation.new(pontuation_params)

    respond_to do |format|
      if @pontuation.save
        format.html { redirect_to @pontuation, notice: 'Pontuation was successfully created.' }
        format.json { render :show, status: :created, location: @pontuation }
      else
        format.html { render :new }
        format.json { render json: @pontuation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pontuations/1
  # PATCH/PUT /pontuations/1.json
  def update
    respond_to do |format|
      if @pontuation.update(pontuation_params)
        format.html { redirect_to @pontuation, notice: 'Pontuation was successfully updated.' }
        format.json { render :show, status: :ok, location: @pontuation }
      else
        format.html { render :edit }
        format.json { render json: @pontuation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pontuations/1
  # DELETE /pontuations/1.json
  def destroy
    @pontuation.destroy
    respond_to do |format|
      format.html { redirect_to pontuations_url, notice: 'Pontuation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pontuation
      @pontuation = Pontuation.find(params[:id])
      #@pontuacao = Pontuation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pontuation_params
      params.require(:pontuation).permit(:data, :nome, :idUsuario, :pontos)
    end
end
