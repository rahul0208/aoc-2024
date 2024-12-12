require "test_helper"

require "day12"
require "csv"

class DayTwelveTest < Test::Unit::TestCase
 test "day10 test1" do
    file = File.open("data/day12.txt")      
    farm = DayTwelve.new
    t=farm.crops(file.readlines)
    assert_equal(81,t)
    end 

end