 
class Square
  attr_reader :centre_x, :centre_y, :size # vygeneruje gettry 
  #@@count=0 #třídní prom.
  def initialize(size, centre_x, centre_y) # zavolá se při tvorbě oběktu
    #@@count+=1
    #@rank = @@count
    @centre_x = centre_x
    @centre_y = centre_y
    @size = size
  end
  
  def to_s
    "Souradnice stredu: #{@centre_x}, #{@centre_y} a velikost strany: #{@size}"
  end
  
  def get_area 
    return @size*@size   
  end
end
