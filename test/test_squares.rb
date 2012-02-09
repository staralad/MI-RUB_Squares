require 'test/unit'
require_relative '../lib/square'
require_relative '../lib/area_of_squares'

class TestAreaOfSquares < Test::Unit::TestCase
  
  def setup
    #definov�n� spole�n�ch prost�edk�
    @spolecny_ctverec = Square.new(4,0,1) 
  end
  
  def teardown
    # zde by bylo uvol�ov�n� spole�n�ch prost�edk�
  end
  
  def test_square_vytvoreni
    ctverec = Square.new(2,0,2)
    refute_nil(ctverec, "Objekt ctverec ze tridy Square by mel byt vytvoren.")  
  end
  
  def test_square_nastaveni_parametru 
    assert_equal(4, @spolecny_ctverec.size)
    assert_equal(0, @spolecny_ctverec.centre_x)
    assert_equal(1, @spolecny_ctverec.centre_y)
  end
  
  def test_square_to_s   
    ocekavano = "Souradnice stredu: 0, 1 a velikost strany: 4"
    assert_equal(ocekavano, @spolecny_ctverec.to_s) 
  end
  
  def test_square_get_area   
    assert_equal(16, @spolecny_ctverec.get_area) 
    assert_equal(0, Square.new(0,0,0).get_area)
    assert_equal(0, Square.new(-0.000,0e-3,+0).get_area)
    assert_equal(5.76, Square.new(2.4,0e3,-0.1).get_area)
  end
  
  def test_area_of_squares_vytvoreni
    area = AreaOfSquares.new(@spolecny_ctverec,Square.new(2,2,2)) 
    refute_nil(area, "Objekt area ze tridy AreaOfSquares by mel byt vytvoren.")  
  end
  
  def test_area_of_squares_get_intersection
    #2 na sob�
    area = AreaOfSquares.new(Square.new(4,2,2),Square.new(2,3,2))
    assert_equal(4, area.get_intersection)
    #2 stejn� na sob�
    area = AreaOfSquares.new(Square.new(2,-2,-2),Square.new(2,-2,-2))
    assert_equal(4, area.get_intersection)  
    #2 nulov� na sob�
    area = AreaOfSquares.new(Square.new(0,0,0),Square.new(0,0,0))
    assert_equal(0, area.get_intersection)
    #p�ekryt� rohem
    area = AreaOfSquares.new(Square.new(2,0,0),Square.new(2,1,1))
    assert_equal(1, area.get_intersection) 
    #p�ekryt� hranou
    area = AreaOfSquares.new(Square.new(2,0,0),Square.new(2,1,0))
    assert_equal(2, area.get_intersection) 
    #dotknut� rohem
    area = AreaOfSquares.new(Square.new(2,0,0),Square.new(2,2,2))
    assert_equal(0, area.get_intersection)
    #dotknut� hranou
    area = AreaOfSquares.new(Square.new(2,0,0),Square.new(2,0,2))
    assert_equal(0, area.get_intersection)
    #bez dotyku
    area = AreaOfSquares.new(Square.new(2,0,0),Square.new(2,3,3))
    assert_equal(-1, area.get_intersection)
  end
  
  def test_area_of_squares_get_area_of_union
    #2 na sob�
    area = AreaOfSquares.new(Square.new(4,2,2),Square.new(2,3,2))
    assert_equal(16, area.get_area_of_union)
    #2 stejn� na sob�
    area = AreaOfSquares.new(Square.new(2,-2,-2),Square.new(2,-2,-2))
    assert_equal(4, area.get_area_of_union)  
    #2 nulov� na sob�
    area = AreaOfSquares.new(Square.new(0,0,0),Square.new(0,0,0))
    assert_equal(0, area.get_area_of_union)
    #nulov� dot�kaj�c� se jin�ho
    area = AreaOfSquares.new(Square.new(0,0,0),Square.new(3,1.5,1.5))
    assert_equal(9, area.get_area_of_union)
    #p�ekryt� rohem
    area = AreaOfSquares.new(Square.new(2,0,0),Square.new(2,1,1))
    assert_equal(7, area.get_area_of_union) 
    #p�ekryt� hranou
    area = AreaOfSquares.new(Square.new(2,0,0),Square.new(2,1,0))
    assert_equal(6, area.get_area_of_union) 
    #dotknut� rohem
    area = AreaOfSquares.new(Square.new(2,0,0),Square.new(2,2,2))
    assert_equal(8, area.get_area_of_union)
    #dotknut� hranou
    area = AreaOfSquares.new(Square.new(2,0,0),Square.new(2,0,2))
    assert_equal(8, area.get_area_of_union)
    #bez dotyku
    area = AreaOfSquares.new(Square.new(2,0,0),Square.new(2,3,3))
    assert_equal(-1, area.get_area_of_union)
  end
  
end