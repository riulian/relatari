class TemesController < ApplicationController
  before_action :set_teme, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except:[:index,:show]
  before_action :correct_user, only: [:edit, :update, :destroy, :create]
  # GET /temes or /temes.json
  def index
    @temes = Teme.all
  end
  
  def teste
    @temes = Teme.all
  end
  # GET /temes/1 or /temes/1.json
  def show
  end

  # GET /temes/new
  def new
    @teme = Teme.new
  end

  # GET /temes/1/edit
  def edit
  end

  # POST /temes or /temes.json
  def create
    @teme = Teme.new(teme_params)

    respond_to do |format|
      if @teme.save
        format.html { redirect_to @teme, notice: "Teme was successfully created." }
        format.json { render :show, status: :created, location: @teme }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temes/1 or /temes/1.json
  def update
    respond_to do |format|
      if @teme.update(teme_params)
        format.html { redirect_to @teme, notice: "Teme was successfully updated." }
        format.json { render :show, status: :ok, location: @teme }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temes/1 or /temes/1.json
  def destroy
    @teme.destroy
    respond_to do |format|
      format.html { redirect_to temes_url, notice: "Teme was successfully destroyed." }
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
    def set_teme
      @teme = Teme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teme_params
      params.require(:teme).permit(:denumire, :despre, :user_id, :actual)
    end
end
