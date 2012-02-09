
require_relative '../lib/square'
require_relative '../lib/area_of_squares'
  
  def is_numeric?(s) #zjistí, zda string lze převést na float
    begin
      Float(s)
    rescue
      false # není číslo
    else
      true # je číslo
    end
  end
  
  def load_data(rank)
    vystup = Array.new(3)
 
    if (rank==1) then
      text = "prvniho"
    else
      text = "druheho"
    end
    
    print "Zadejte delku hrany #{text} ctverce: "
    value = gets.chop                                           #uložím si řetězec bez ukončovacího znaku
    value_f = value.to_f                                        #zkusím převést na float (pokud se nepovede vrací => 0.0 ... jinak hodnotu čísla)
    
    # if ((value_f != 0 || value == "0") && (value_f >= 0)) then  #pokud se povedlo nebo číslo bylo 0 a současně číslo není záporné
    if (is_numeric?(value) && (value_f >= 0)) then 
      vystup[0] = value.to_f
    else                                                        # jinak výpis a ukončit
      puts "Spatny vstup."
      Process.exit
    end
    
    iter = 0;
    texts = ['x-ovou', 'y-ovou']
    
    2.times{                                                    # pro X-ovou i Y-ouvou hodnotu
      print "Zadejte #{texts[iter]} souradnici stredu #{text} ctverce: "
      value = gets.chop                                           #uložím si řetězec bez ukončovacího znaku
      value_f = value.to_f                                        #zkusím převést na float (pokud se nepovede vrací => 0.0 ... jinak hodnotu čísla)  
      if (is_numeric?(value)) then                      #pokud se povedlo nebo číslo bylo 0 
        if (iter==0) then
          vystup[1] = value.to_f
        else
          vystup[2] = value.to_f
        end 
      else                                                        # jinak výpis a ukončit
        puts "Spatny vstup."
        Process.exit
      end    
      iter+=1
    }
    
    return vystup
  end
  

#načtu data a vytvořím objekty
data = load_data(1)
sq_a = Square.new(data[0],data[1],data[2])
data = load_data(2)
sq_b = Square.new(data[0],data[1],data[2])

  
  area = AreaOfSquares.new(sq_a, sq_b)
  result = area.get_area_of_union
  if(result == -1)then
   puts "Ctverce se ani nedotykaji."
  else
   puts "Obsah sjednoceni dvou ctvercu je #{result}." 
  end
  
 
=begin
print "Zadejte x-ovou souradnici stredu prvniho ctverce: "
rec1_x = gets.chop

print "Zadejte y-ovou souradnici stredu prvniho ctverce: "
rec1_y = gets.chop

print "Zadejte delku hrany druheho ctverce: "
rec2_length = gets.chop

print "Zadejte x-ovou souradnici stredu druheho ctverce: "
rec2_x = gets.chop

print "Zadejte y-ovou souradnici stredu druheho ctverce: "
rec2_y = gets.chop


result_union = 0

print "Obsah sjednoceni dvou ctvercu je #{result_union}."
=end







#ctverec = Rectangle.new(1, 2)
#puts ctverec.to_s
#puts ctverec.centreX
#puts ctverec.centreY