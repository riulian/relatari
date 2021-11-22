class RelataresController < ApplicationController
  before_action :set_relatare, only: %i[ show edit update destroy ]
 
  before_action :authenticate_user!, except:[:index,:show,:index1]
  before_action :correct_user, only: [:edit, :update, :destroy, :create]
  respond_to :js, :html, :xml, :json
  # GET /relatares or /relatares.json
  def index

    if params[:cal1]==nil
        @relatares = Relatare.paginate(page: params[:page], per_page: 10)
        @calitati = Calitati.all  
    else
      @y=params[:cal1]
      if @y!="toate"
        @id1=(params[:id1])
        k=Calitati.find(@id1)
        @calitati=Calitati.all
        @relatares = k.relatares.paginate(page: params[:page], per_page: 1)
      else
        @relatares = Relatare.paginate(page: params[:page], per_page: 10)
        @calitati = Calitati.all  
        
        
      end  
    end    
  end
  def index1
    @y=params[:cal1]
    if params[:cal1]==nil
      @relatares = Relatare.paginate(page: params[:page], per_page: 10)
      @calitati = Calitati.all
      respond_to do |f|
        #f.js  
        f.html
      end
    else
      if @y!="toate"
        @id1=(params[:id1])
        k=Calitati.find(@id1)
        @calitati=Calitati.all
        @relatares = k.relatares.paginate(page: params[:page], per_page: 3)
        respond_to do |f|
          f.js  
          #f.html
        end
      else
        @relatares = Relatare.paginate(page: params[:page], per_page: 10)
        @calitati = Calitati.all  
        respond_to do |f|
          f.js  
          f.html
        end
        
      end  
    end
end
  def test1
    
   
  end
    
  # GET /relatares/1 or /relatares/1.json
  def show
  end

  # GET /relatares/new
  def new
    @relatare = Relatare.new
    @calitati = Calitati.all
    #@relatare.calitatis.build
  end

  # GET /relatares/1/edit
  def edit
    @calitati = Calitati.all
  end

  # POST /relatares or /relatares.json
  def create
    @relatare = Relatare.new(relatare_params)
    
    respond_to do |f|
      if @relatare.save
        
        f.html { redirect_to @relatare, notice: "Relatare was successfully created." }
        f.json { render :show, status: :created, location: @relatare }
      else
        f.html { render :new, status: :unprocessable_entity }
        f.json { render json: @relatare.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /relatares/1 or /relatares/1.json
  def update
    respond_to do |format|
      if @relatare.update(relatare_params)
        format.html { redirect_to @relatare, notice: "Relatare was successfully updated." }
        format.json { render :show, status: :ok, location: @relatare }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @relatare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relatares/1 or /relatares/1.json
  def destroy
    @relatare.destroy
    respond_to do |format|
      format.html { redirect_to relatares_url, notice: "Relatare was successfully destroyed." }
      #format.json { head :no_content }
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
    def set_relatare
      @relatare = Relatare.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def relatare_params
      params.require(:relatare).permit(:textro,  :texten, :user_id, :calitati_ids=>[])
    end
end
