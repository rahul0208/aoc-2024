require "test_helper"

require "day7"
require "csv"

class DaySevenTest < Test::Unit::TestCase
  test "day7 test1" do
    cal = DaySeven.new
    cal.calibrate("190: 10 19")
    cal.calibrate("3267: 81 40 27")
    cal.calibrate("83: 17 5")
    cal.calibrate("156: 15 6")
    cal.calibrate("7290: 6 8 6 15")
    cal.calibrate("161011: 16 10 13")
    cal.calibrate("192: 17 8 14")
    cal.calibrate("21037: 9 7 18 13")
    cal.calibrate("292: 11 6 16 20")

    assert_equal(11387,cal.total)
    
  end

  # test "day 7 test2" do
  #   file = File.open("data/day7.txt")      
  #   cal =  DaySeven.new
  #    idx =0
    
  #   file.readlines().each do |line|    
  #     puts "processing line #{idx}"   
  #     cal.calibrate(line)
  #     idx += 1
  #   end    
  #   assert_equal(426214131924213,cal.total)

  # end

end
