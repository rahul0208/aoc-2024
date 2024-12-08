require "test_helper"

require "day8"
require "csv"

class DayEightTest < Test::Unit::TestCase
  # test "day7 test1" do
  #   radio = DayEight.new

  #   radio.addAntena("............")
  #   radio.addAntena("........0...")
  #   radio.addAntena(".....0......")
  #   radio.addAntena(".......0....")
  #   radio.addAntena("....0.......")
  #   radio.addAntena("......A.....")
  #   radio.addAntena("............")
  #   radio.addAntena("............")
  #   radio.addAntena("........A...")
  #   radio.addAntena(".........A..")
  #   radio.addAntena("............")
  #   radio.addAntena("............")

  #   radio.antidote()


  #   assert_equal(11387,radio.loc)
    
  # end
  test "day 8 test2" do
    file = File.open("data/day8-0.txt")      
    radio =  DayEight.new
    radio.antena(file.readlines())
    r=radio.determineAntidote
    assert_equal(34,r.keys.size)
  end

  test "day 8 test3" do
    file = File.open("data/day8.txt")      
    radio =  DayEight.new
    radio.antena(file.readlines())
    r=radio.determineAntidote
    assert_equal(1259,r.keys.size)
  end

end
