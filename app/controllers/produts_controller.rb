class ProdutsController < ApplicationController
  before_action :set_produt, only: [:show, :edit, :update, :destroy]

  # GET /produts
  # GET /produts.json
  def index
    @produts = Produt.all
  end

  # GET /produts/1
  # GET /produts/1.json
  def show
  end

  # GET /produts/new
  def new
    @produt = Produt.new
  end

  # GET /produts/1/edit
  def edit
  end

  # POST /produts
  # POST /produts.json
  def create
    @produt = Produt.new(produt_params)

    respond_to do |format|
      if @produt.save
        format.html { redirect_to @produt, notice: 'Produt was successfully created.' }
        format.json { render :show, status: :created, location: @produt }
      else
        format.html { render :new }
        format.json { render json: @produt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produts/1
  # PATCH/PUT /produts/1.json
  def update
    respond_to do |format|
      if @produt.update(produt_params)
        format.html { redirect_to @produt, notice: 'Produt was successfully updated.' }
        format.json { render :show, status: :ok, location: @produt }
      else
        format.html { render :edit }
        format.json { render json: @produt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produts/1
  # DELETE /produts/1.json
  def destroy
    @produt.destroy
    respond_to do |format|
      format.html { redirect_to produts_url, notice: 'Produt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produt
      @produt = Produt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produt_params
      params.require(:produt).permit(:name, :description, :image_url)
    end
end
