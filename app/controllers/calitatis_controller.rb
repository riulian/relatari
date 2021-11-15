class CalitatisController < ApplicationController
  before_action :set_calitati, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except:[:index,:show]
  before_action :correct_user, only: [:edit, :update, :destroy, :create]
  # GET /calitatis or /calitatis.json
  def index
    @calitatis = Calitati.all
    
  end

  # GET /calitatis/1 or /calitatis/1.json
  def show
  end

  # GET /calitatis/new
  def new
    @calitati = Calitati.new
  end

  # GET /calitatis/1/edit
  def edit
   
  end

  # POST /calitatis or /calitatis.json
  def create
    @calitati = Calitati.new(calitati_params)

    respond_to do |format|
      if @calitati.save
        format.html { redirect_to @calitati, notice: "Calitati was successfully created." }
        format.json { render :show, status: :created, location: @calitati }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calitati.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calitatis/1 or /calitatis/1.json
  def update
    respond_to do |format|
      if @calitati.update(calitati_params)
        format.html { redirect_to @calitati, notice: "Calitati was successfully updated." }
        format.json { render :show, status: :ok, location: @calitati }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calitati.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calitatis/1 or /calitatis/1.json
  def destroy
    @calitati.destroy
    respond_to do |format|
      format.html { redirect_to calitatis_url, notice: "Calitati was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def correct_user
    @role = current_user.role
    redirect_to calitatis_path, notice: "Nu esti logat. Nu ai autorizatie" if @role.nil?
    if current_user.role!='admin'
    redirect_to calitatis_path, notice: "Nu ai autorizatie sa modifici!"  
    end  
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calitati
      @calitati = Calitati.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calitati_params
      params.require(:calitati).permit(:denumire)
    end
end
