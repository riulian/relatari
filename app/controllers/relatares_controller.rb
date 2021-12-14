class RelataresController < ApplicationController
  before_action :set_relatare, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except:[:index,:show,:index1]#trebuie sa fii autentificat pt a avea acces la: new(Relatare noua),edit,create,update,delete -nu ai acces la acestea
  before_action :correct_user, only: [:edit, :update, :destroy, :create,:relatarile_mele]
  before_action :verificare_autorizatie, only: [:edit, :destroy, :update, :seteaza_tema]
  respond_to :js, :html, :xml, :json
  # GET /relatares or /relatares.json
  
  def index

    if params[:cal1]==nil
        @relatares = Relatare.paginate(page: params[:page], per_page: 13).order(created_at: :desc).limit(12)
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
    @tema_actuala=@relatare['teme_id']
  end

  # GET /relatares/new
  def new
    @metoda="new"
    @relatare = Relatare.new
    @calitati = Calitati.all
    if params[:tema_actuala]!=nil
    @tema_actuala=params[:tema_actuala]
    end
    if params["optionValue"]!=nil
      @tema_actuala=params["optionValue"]
    end  


  end

  # GET /relatares/1/edit
  def edit
    @metoda="edit"
    @calitati = Calitati.all
  end

  # POST /relatares or /relatares.json
  def create
    @tema_actuala=params['teme_id']
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
    if current_user.role!='admin'
      redirect_to relatares_path, notice: "Nu ai autorizatie sa modifici!"
      return
    end 
    @relatare.destroy
    respond_to do |format|
      format.html { redirect_to relatares_url, notice: "Relatare was successfully destroyed." }
      #format.json { head :no_content }
    end
  end
  def correct_user
    @role = current_user.role
  end

  def relatarile_mele
    @user1=current_user.id
    #@user1=@user2.instance_of?
    #@relatares = Relatare.paginate(page: params[:page], per_page: 10).find_by(user_id: 6)
    @relatares = Relatare.paginate(page: params[:page], per_page: 10).where({user_id: @user1})
    #@relatares=Relatare.find_by(user_id: @user1)
    
    @calitati = Calitati.all
  end   
  def relatarit
    
    
    @temes=Teme.all
    @afisare_buton_relatare=1
    @op=params["optionValue"]
    
    if params["optionValue"]==nil
      @tema_actuala = Teme.where(actual: 1).first.id
      @relatares=Relatare.paginate(page: params[:page], per_page: 2).where({teme_id: @tema_actuala}).order(created_at: :desc)
      respond_to do |f|
        f.js  
        f.html
      end
    else
    @afisare_buton_relatare=1
    @tema_actuala=@op
    @relatares=Relatare.paginate(page: params[:page], per_page: 2).where({teme_id: @op})
    
    
      respond_to do |f|
        f.js  
        
      end
   end
  end 
  def add_tema
    @tema=Tema.new
  end
  def seteaza_tema
    @tema_acum = (Teme.where({actual: 1})).first.denumire
    if params['teme_id']!=nil
      @tema_selectata=Teme.where({id: params['teme_id']}).first.denumire
      u= (Teme.where({actual: 1})).first
      u.actual=0
      u.save
      v=Teme.where({id: params['teme_id']}).first
      v.actual=1
      v.save
    else
      @tema_selectata="nu este acum"  
    end  
    @tema_acum = (Teme.where({actual: 1})).first.denumire
  end  
  def testjson
    @varjson = [{nume: 'Iulian',email: 'iuli@yahoo.com'},{adresa: 'Bucuresti',telefon: '0745...'}]
    render json: @varjson
  end  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relatare
      @relatare = Relatare.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def relatare_params
      params.require(:relatare).permit(:textro,  :texten, :user_id, :teme_id, :calitati_ids=>[])
    end
    def verificare_autorizatie
      if current_user.role!='admin' 
          begin #aici codul imi da eroare la MODIF TEMA - relatare.user_id =nil. de aceea folosesc rescue (chiar daca da eroare codul merge mai departe) 
            
          rescue => exception
            if  current_user.id!=@relatare.user_id #CODUL ACESTA NU DA EROARE LA: EDIT DESTROY pt ca am relatare.user_id care nu e nil
            redirect_to relatares_path, notice: "Nu ai autorizatie sa modifici!"
          end  
          end
          
          if current_user.role!='admin'
            redirect_to relatares_path, notice: "Nu ai autorizatie sa modifici!"
          end 
      end 
    end 
    
    
end
