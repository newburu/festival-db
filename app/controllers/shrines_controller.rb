class ShrinesController < ApplicationController
  before_action :set_shrine, only: %i[ show edit update destroy ]

  # GET /shrines or /shrines.json
  def index
    @q = Shrine.ransack(params[:q])
    @pagy, @shrines = pagy @q.result(distinct: true).order('created_at DESC')
  end

  # GET /shrines/1 or /shrines/1.json
  def show
  end

  # GET /shrines/new
  def new
    @shrine = Shrine.new
  end

  # GET /shrines/1/edit
  def edit
  end

  # POST /shrines or /shrines.json
  def create
    @shrine = Shrine.new(shrine_params)

    respond_to do |format|
      if @shrine.save
        format.html { redirect_to shrine_url(@shrine), notice: "Shrine was successfully created." }
        format.json { render :show, status: :created, location: @shrine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shrine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shrines/1 or /shrines/1.json
  def update
    respond_to do |format|
      if @shrine.update(shrine_params)
        format.html { redirect_to shrine_url(@shrine), notice: "Shrine was successfully updated." }
        format.json { render :show, status: :ok, location: @shrine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shrine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shrines/1 or /shrines/1.json
  def destroy
    @shrine.destroy

    respond_to do |format|
      format.html { redirect_to shrines_url, notice: "Shrine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shrine
      @shrine = Shrine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shrine_params
      params.require(:shrine).permit(:name, :address)
    end
end
