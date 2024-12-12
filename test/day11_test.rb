require "test_helper"

require "day11"
require "csv"

class DayElevenTest < Test::Unit::TestCase
    
  # test "day10 test1" do
  #   # file = File.open("data/day10.txt")      
  #   line = DayEleven.new(["125","17"])
  #   a = line.stones
  #   line.blinkCount(75)
  #   # for i in 1..25 do
  #   #   b = line.blink(a)
  #   #   a = b
  #   #   puts "#{i} - #{a.length}"
  #   # end
  # end

  test "day10 test2" do
    # file = File.open("data/day10.txt")      
    line = DayEleven.new(["2","77706","5847","9258441","0","741","883933","12"])
    line.blinkCount(75)
  end

end