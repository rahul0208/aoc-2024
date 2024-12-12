require "test_helper"

require "day9"
require "csv"

class DayNineTest < Test::Unit::TestCase
    test "day9 test1" do
        compactor = DayNine.new
        cksum=compactor.disk("2333133121414131402")
        assert_equal(2858,cksum)
    end
      
  # test "day 9 test2" do
  #   file = File.open("data/day9.txt")      
  #   compactor = DayNine.new
  #   cksum=compactor.disk(file.readlines[0])
  #   assert_equal(6398065450842,cksum)
  # end
end