class Test1Controller < ApplicationController
  
  
  
  def index
    @t1=55
    @t2=params
    
  end
  def add_person
    @a=params[:ax]
    @b=params[:bx]
    @d=@t1
    @c=params
    @suma =(@a).to_i+(@b).to_i

    #redirect_to test1_index_path(:@suma => @suma)
    #redirect_to test1_index_path(params.to_unsafe_hash)
  end  
  
end
