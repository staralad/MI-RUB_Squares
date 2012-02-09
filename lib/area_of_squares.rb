
require_relative './square'

class AreaOfSquares
  def initialize(square1, square2)
    @square1 = square1
    @square2 = square2
  end
    
  def get_area_of_union   
    #řeším přes průnik
    intersec = get_intersection
    
    if(intersec == -1)then # pokud se vůbec nedotýkají
      return -1
    else
      return (@square1.get_area + @square2.get_area - intersec) 
    end       
  end
 
  #vrátí hodnotu průniku, pokud není tak 0 a pokud se vůbec nedotýkají, tak -1
  def get_intersection 
    half1 = @square1.size/2.0          
    half2 = @square2.size/2.0
    
    s1_hi_x = @square1.centre_x+half1
    s1_lo_x = @square1.centre_x-half1
    s1_hi_y = @square1.centre_y+half1
    s1_lo_y = @square1.centre_y-half1
    
    s2_hi_x = @square2.centre_x+half2
    s2_lo_x = @square2.centre_x-half2
    s2_hi_y = @square2.centre_y+half2
    s2_lo_y = @square2.centre_y-half2
    
    #    puts "(#{s1_hi_x}, #{s1_lo_x}, #{s1_hi_y}, #{s1_lo_y}) a (#{s2_hi_x}, #{s2_lo_x}, #{s2_hi_y}, #{s2_lo_y})"
    
    hi_x = 0
    lo_x = 0
    hi_y = 0
    lo_y = 0
    
    if(@square1.centre_x < @square2.centre_x) then  # střed S1 má menší X-ovou hodnotu než S2  
      if((s1_hi_x >= s2_lo_x) && (s1_lo_y <= s2_hi_y) && (s1_hi_y >= s2_lo_y)) then #musí bát >=/<= (ne jen >/<), protože když se dotýkají hranama, je sčítám
        #!! je průnik
        if(s1_hi_x < s2_hi_x)then
          hi_x = s1_hi_x
        else
          hi_x = s2_hi_x
        end
        if(s1_lo_x < s2_lo_x)then
          lo_x = s2_lo_x
        else
          lo_x = s1_lo_x
        end
        if(s1_hi_y < s2_hi_y)then
          hi_y = s1_hi_y
        else
          hi_y = s2_hi_y
        end
        if(s1_lo_y < s2_lo_y)then
          lo_y = s2_lo_y
        else
          lo_y = s1_lo_y
        end

        #intersection = (hi_x-lo_x)*(hi_y-lo_y)
      else
        #puts "Ctverce se ani nedotykaji."
        return -1
        #Process.exit
      end

    else # střed S1 má větší nebo rovnu X-ovou souřadnici jak střed S2
      
      if((s2_hi_x >= s1_lo_x) && (s2_lo_y <= s1_hi_y) && (s2_hi_y >= s1_lo_y)) then
        #!! je průnik
        if(s2_hi_x < s1_hi_x)then
          hi_x = s2_hi_x
        else
          hi_x = s1_hi_x
        end
        if(s2_lo_x < s1_lo_x)then
          lo_x = s1_lo_x
        else
          lo_x = s2_lo_x
        end
        if(s2_hi_y < s1_hi_y)then
          hi_y = s2_hi_y
        else
          hi_y = s1_hi_y
        end
        if(s2_lo_y < s1_lo_y)then
          lo_y = s1_lo_y
        else
          lo_y = s2_lo_y
        end

        #intersection = (hi_x-lo_x)*(hi_y-lo_y)
      else
        #puts "Ctverce se ani nedotykaji."
        return -1
        #Process.exit
      end     
    end #konec if
    
   return (hi_x-lo_x)*(hi_y-lo_y)
  end
     
end
