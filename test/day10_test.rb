require "test_helper"

require "day10"
require "csv"

class DayTenTest < Test::Unit::TestCase
    
  test "day10 test1" do
    file = File.open("data/day10.txt")      
    map = DayTen.new
    t=map.locations(file.readlines)

    assert_equal(81,t)
  end

  # test "day10 test2" do
  #   file = File.open("data/day10_1.txt")      
  #   map = DayTen.new
  #   t=map.locations(file.readlines)

  #   assert_equal(816,t)
  # end
end